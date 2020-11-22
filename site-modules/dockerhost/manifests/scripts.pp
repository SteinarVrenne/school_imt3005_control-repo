class dockerhost::scripts {

    require dockerhost::images
    # Ensure buildContainer.sh is on the servers and run it once
    file { '/root/buildContainer.sh':
        source => "puppet:///modules/dockerhost/buildContainer.sh",
        mode => "0755",
    }

    exec { 'bash /root/buildContainer.sh':
        path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        user => 'root',
        cwd => '/root/',
        subscribe => [ File['/root/images/kali_base/Dockerfile'], File['/root/buildContainer.sh'] ]
    }
}