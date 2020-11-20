class profile::dockerhost::scripts {

    # Ensure buildContainer.sh is on the servers and run it once
    file { '/root/buildContainer.sh':
        source => "puppet://scripts/kali/buildContainer.sh",
        mode => "0755",
    }

    exec { 'bash /root/buildContainer.sh':
        path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        user => 'root',
        cwd => '/root/',
        subscribe => File['/root/dockerImages/pentest/Dockerfile'],
    }


}
