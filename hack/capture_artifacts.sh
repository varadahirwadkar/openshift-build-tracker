    #!/bin/bash -x
    echo "Capturing the System Information"
    if [ -d ${WORKSPACE}/canary-deployments ];then
        cd ${WORKSPACE}/canary-deployments
    else
        exit 1 
    fi
    # Capturing Teraform template
    if [ ! -f ${WORKSPACE}/canary-deployments/templates/.deploy-power-powervc.tfvars.template ]; then
        echo "${WORKSPACE}/canary-deployments/templates/.deploy-power-powervc.tfvars.template not found!"
        exit 1
    else
        cp ${WORKSPACE}/canary-deployments/templates/.deploy-power-powervc.tfvars.template deploy-power-powervc.tfvars.template
        sed -i "s|ftp3_password.*$|ftp3_password  = ************|g" deploy-power-powervc.tfvars.template
    fi
    if [ ! -f .deploy-power-powervc.tfvars ]; then
        echo ".deploy-power-powervc.tfvars not found!"
        exit 1
    else
        cp .deploy-power-powervc.tfvars deploy-power-powervc.tfvars
        sed -i "s|ftp3_password.*$|ftp3_password  = ************|g" deploy-power-powervc.tfvars
        sed -i "s|icp_version.*=.*@|icp_version = \"user:************@|g" deploy-power-powervc.tfvars
        sed -i "s|docker_password.*$|docker_password: ************|g" deploy-power-powervc.tfvars
        sed -i "s|header.*X-JFrog-Art-Api.*$|header.*X-JFrog-Art-Api: ************|g" deploy-power-powervc.tfvars
    fi
    MASTER_NODE=$(make terraform:output TERRAFORM_DIR=.deploy-power-powervc TERRAFORM_OUTPUT_VAR=master-node || true)
    [ $? -ne 0 ] && exit 1;
    if [ ! -z "${MASTER_NODE}" ]; then
        ssh -q -i id_rsa -o StrictHostKeyChecking=no root@${MASTER_NODE} exit
        rc=$?
        if [ $? -eq 0 ] ; then
            scp -i id_rsa -o StrictHostKeyChecking=no ${WORKSPACE}/${PROJECTNAME}/hack/system_info.sh root@${MASTER_NODE}:
            ssh -i id_rsa -o StrictHostKeyChecking=no root@${MASTER_NODE} /root/system_info.sh > systeminfo.txt
            tar -czvf systeminfo.txt.tar.gz systeminfo.txt
            if ssh -i id_rsa -o StrictHostKeyChecking=no root@${MASTER_NODE} '[ -d /opt/ibm/cluster ]' ;then
                scp -i id_rsa -o StrictHostKeyChecking=no ${WORKSPACE}/${PROJECTNAME}/hack/health_check.sh root@${MASTER_NODE}:/opt/ibm/cluster/
                ssh -i id_rsa -o StrictHostKeyChecking=no root@${MASTER_NODE} rm -rf /opt/ibm/cluster/images
                ssh -i id_rsa -o StrictHostKeyChecking=no root@${MASTER_NODE} /opt/ibm/cluster/health_check.sh
                scp -i id_rsa -o StrictHostKeyChecking=no -r root@${MASTER_NODE}:/opt/ibm/cluster .
                sed -i "s|header: 'X-JFrog-Art-Api.*$|header: 'X-JFrog-Art-Api: ************|g" cluster/config.yaml
                sed -i "s|docker_password.*$|docker_password: ************|g" cluster/config.yaml
                tar -czvf cluster.tar.gz cluster
            fi
        else
            echo 'Unable to access the cluster. You may delete the VMs manually'
        fi
    else
        echo 'Unable to access the cluster. You may delete the VMs manually'
    fi