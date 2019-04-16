#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

WHAT="${WHAT:-}"

INFRA_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd -P)"

if [[ -z "${WHAT}" ]]; then
    pushd ${INFRA_ROOT}
    jenkinsfiles=(`find jobs/pipelines -name Jenkinsfile -print`)
    popd
else
    jenkinsfiles=(${WHAT})
fi

echo "Loading pipelines: ${jenkinsfiles[@]}"
TMP_DIR=$(mktemp -d)
for jenkinsfile in "${jenkinsfiles[@]}"
do
	JENKINS_FILE=${jenkinsfile}
	JOB_NAME=$(dirname ${INFRA_ROOT}/${jenkinsfile}| xargs basename)
	echo "{\"JOB_NAME\":${JOB_NAME},\"JENKINS_FILE\":${JENKINS_FILE}}" | jinja2 ${INFRA_ROOT}/hack/jjb_template.jinja2 > ${TMP_DIR}/${JOB_NAME}.yml
done

jenkins-jobs --user ${JENKINS_USER} --password ${JENKINS_PASSWORD} update ${TMP_DIR}
