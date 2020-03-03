    #!/bin/bash -x
    echo "Capturing the System Information"
    if [ -d ${WORKSPACE}/deploy ];then
        cd ${WORKSPACE}/deploy
    else
        exit 1 
    fi
    # Capturing Teraform template
    if [ ! -f ${WORKSPACE}/deploy/.${TARGET}.tfvars ]; then
        echo "${WORKSPACE}/deploy/.${TARGET}.tfvars not found!"
        exit 1
    else
        cp ${WORKSPACE}/deploy/.${TARGET}.tfvars ${TARGET}.tfvars
        sed -i "s|ftp3_password.*$|ftp3_password  = ************|g" ${TARGET}.tfvars
        sed -i "s|repo_token.*$|repo_token  = ************|g" ${TARGET}.tfvars
        sed -i "s|icp_version.*=.*@|icp_version = \"user:************@|g" ${TARGET}.tfvars
        sed -i "s|docker_password.*$|docker_password: ************|g" ${TARGET}.tfvars
        sed -i "s|header.*X-JFrog-Art-Api.*$|header.*X-JFrog-Art-Api: ************|g" ${TARGET}.tfvars
        sed -i "s|password.*=.*$|password = ************|g" ${TARGET}.tfvars
        sed -i "s|rhel_subscription_password.*=.*$|rhel_subscription_password = ************|g" ${TARGET}.tfvars
        cp ${TARGET}.tfvars powervc.tfvars
    fi