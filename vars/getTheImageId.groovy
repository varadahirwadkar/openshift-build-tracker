def call(String auth_url, String image_name){
    // this get the image ID from powervc based on the distro chose.
    IMAGE_ID=sh(returnStdout: true, script: "openstack --os-auth-url \"${auth_url}\" image show  \"${image_name}\" -c id --insecure | grep id | awk '{print \$4}'|tr '\n' ' ' ").trim()
    return IMAGE_ID
}
