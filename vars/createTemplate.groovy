def call(String auth_url, String vcpus, String memory, String punits, String templatetag){
    // this creates a compute template in PowerVC server based on the choice
    environment {
      OS_USERNAME=credentials('GITHUB_USER')
      OS_PASSWORD=credentials('TF_VAR_password')
      OS_IDENTITY_API_VERSION="${env.OS_IDENTITY_API_VERSION}"
      OS_TENANT_NAME="${env.OS_TENANT_NAME}"
    }
    def status = sh(returnStatus: true, returnStdout: false, script: "openstack  --os-auth-url \"${auth_url}\" --insecure flavor create --id ${templatetag}  --ram ${memory} --vcpus ${vcpus} ${templatetag} --property powervm:proc_units=${punits}")
    return status
}
