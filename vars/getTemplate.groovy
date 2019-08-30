def call(String virtualization, String serverConfig, String node){
    //This function returns PowerVC zone information 
    if (virtualization == "KVM" && serverConfig == "Min")
    {   
        TEMPLATE=sh(returnStdout: true, script: "grep \"${node}\" conf/computetemplates/kvmminconfig.conf|awk 'BEGIN{FS=\"${node}=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else if (virtualization == "KVM" && serverConfig == "Max")
    {
        TEMPLATE=sh(returnStdout: true, script: "grep \"${node}\" conf/computetemplates/kvmmaxconfig.conf|awk 'BEGIN{FS=\"${node}=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else if (virtualization == "PowerVM" && serverConfig == "Min")
    {
        TEMPLATE=sh(returnStdout: true, script: "grep \"${node}\" conf/computetemplates/pvmminconfig.conf|awk 'BEGIN{FS=\"${node}=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else if (virtualization == "PowerVM" && serverConfig == "Max")
    {
        TEMPLATE=sh(returnStdout: true, script: "grep \"${node}\" conf/computetemplates/pvmmaxconfig.conf|awk 'BEGIN{FS=\"${node}=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else if (virtualization == "PowerVM" && serverConfig == "Mid")
    {
        TEMPLATE=sh(returnStdout: true, script: "grep \"${node}\" conf/computetemplates/pvmmidconfig.conf|awk 'BEGIN{FS=\"${node}=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else
    {
        return null
    }
    return TEMPLATE
}