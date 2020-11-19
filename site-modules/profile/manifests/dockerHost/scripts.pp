class profile::dockerHost::scripts {

    # Ensure buildContainer.sh is on the servers and run it once
    file { '/root/buildContainer.sh': 
        source => "puppet:///scripts/kali/buildContainer.sh",
        mode => "0755",
    }
    
}