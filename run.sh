#!/bin/sh

run_script() {
  for x in 6 7 8 9
  do
  VERSION=`curl -X GET "https://quay.io/api/v1/repository/openshift-release-dev/ocp-release/tag/?onlyActiveTags=true" | jq '.tags | sort_by(.start_ts) | .[].name'  | grep 4.$x | grep "ppc64le"  | grep -v multi | tail -1 |  tr -d '"'`
  if [ "$(cat versions/4.$x.txt)" != $VERSION ];
  then
  echo $VERSION > versions/4.$x.txt
  fi
  done
}

setup_git() {
  git checkout -b main
  git config --global user.email "${GH_EMAIL}"
  git config --global user.name "${GH_NAME}"
}

commit_files() {
  git add . versions
  git commit --message "Update OCP versions"
}

upload_files() {
  git remote add origin-page https://${GH_TOKEN}@github.com/pravin-dsilva/openshift-build-tracker > /dev/null 2>&1
  git push --quiet --set-upstream origin-page main
}

run_script
setup_git
commit_files
upload_files
