#!/bin/bash
# -health check
echo -e "***** Getting cluster Info ICP Cluster *****"
[ -d /opt/ibm/cluster ] && cd /opt/ibm/cluster
inception=$(docker images | grep inception | awk '{print $3}')
docker run --net=host -t -e LICENSE=accept -v "$(pwd)":/installer/cluster ${inception} healthcheck || exit 0
echo -e "***** Getting cluster Info from OCP-ICP clusrer *****"
[ -d /root/cluster ] && cd /root/cluster
inception=$(docker images | grep inception | awk '{print $3}')
docker run --net=host -t -e LICENSE=accept -v "$(pwd)":/installer/cluster ${inception} healthcheck || exit 0