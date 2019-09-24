#!/bin/bash
# -health check
if [ ${OCP_ENV} == true ];then install_dir="/root/" ;else install_dir="/opt/ibm";fi
echo -e "***** Getting cluster Info ICP Cluster *****"
inception=$(docker images | grep inception | awk '{print $3}')
[ -d ${install_dir}/cluster ] && cd ${install_dir}/cluster
docker run --net=host -t -e LICENSE=accept -v "$(pwd)":/installer/cluster ${inception} healthcheck || exit 0