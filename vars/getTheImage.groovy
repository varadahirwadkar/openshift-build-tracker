def call(String auth_url, String distro){
    // this get the image from powervc based on the distro chose.
    switch(distro) {
        case "RHEL7.6":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i rhel7.6| grep -i -v  rhel7.6-alt|tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="rhel"
            break
        case "RHEL7.5":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i rhel7.5| grep -i -v rhel7.5-alt|tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="rhel"
            break
        case "UBUNTU18.04":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list --format value -c Name | grep -i cicd | grep -i u18.04| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="ubuntu"
            break
        case "UBUNTU16.04":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i u16.04| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="ubuntu"
            break
        case "RHEL7.6-ALT":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i rhel7.6-alt| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="rhel"
            break
        case "RHEL7.5-ALT":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i rhel7.5-alt| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="rhel"
            break
        case "SLES12SP3":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i sles12.*sp3| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="sles"
            break
        case "SLES12SP4":
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i sles12.*sp4| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="sles"
            break
        default:
            IMAGE=sh(returnStdout: true, script: "OS_USERNAME=${env.OS_USERNAME} OS_PASSWORD=${env.OS_PASSWORD} OS_IDENTITY_API_VERSION=${env.OS_IDENTITY_API_VERSION} OS_TENANT_NAME=${env.OS_TENANT_NAME} openstack --os-auth-url \"${auth_url}\" --insecure image list  --format value -c Name | grep -i cicd | grep -i rhel7.6| tail -n 1|tr '\n' ' ' ").trim()
            env.DISTRO="rhel"
            break
    }

    return IMAGE
}
