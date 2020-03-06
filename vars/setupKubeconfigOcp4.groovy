def call(String auth_url)
{
    // Run the script
    sh (returnStdout: false, script: "/bin/bash ${WORKSPACE}/hack/setupkubeconfig_ocp4.sh || true")
}
