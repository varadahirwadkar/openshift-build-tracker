def call(String virtualization, String hardware){
    //This function returns PowerVC zone information 
    if (virtualization == "KVM" && hardware == "P9")
    {   
        ZONE=sh(returnStdout: true, script: "grep ZONE_P9 conf/infra/kvm.conf|awk 'BEGIN{FS=\"ZONE_P9=\"}{print \$2}'|tr '\n' ' ' ").trim()
    }
    else if (virtualization == "KVM" && hardware == "P8")
    {
        ZONE=sh(returnStdout: true, script: "grep ZONE_P8 conf/infra/kvm.conf|awk 'BEGIN{FS=\"ZONE_P8=\"}{print \$2}'|tr '\n' ' ' ").trim()
    }
    else if (virtualization == "PowerVM" && hardware == "P9")
    {
        ZONE=sh(returnStdout: true, script: "grep ZONE_P9 conf/infra/pvm.conf|awk 'BEGIN{FS=\"ZONE_P9=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else if (virtualization == "PowerVM" && hardware == "P8")
    {
        ZONE=sh(returnStdout: true, script: "grep ZONE_P8 conf/infra/pvm.conf|awk 'BEGIN{FS=\"ZONE_P8=\"}{print \$2}'|tr '\n' ' '").trim()
    }
    else
    {
        return null
    }
    return ZONE
}
