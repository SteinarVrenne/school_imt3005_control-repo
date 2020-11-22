class dockerhost::scripts {

    require dockerhost::images
    # Ensure buildContainer.sh is on the servers and run it once
    file { '/root/script/buildContainer.sh':
        source => "puppet:///modules/dockerhost/script/buildContainer.sh",
        mode   => "0755",
    }

    exec { 'bash /root/script/buildContainer.sh':
        path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        user => 'root',
        cwd => '/root/',
        subscribe => [ File['/root/images/kali_base/Dockerfile'], File['/root/script/buildContainer.sh'], File['/root/script/vncpasswd.sh'], File['/root/script/vnc.sh'] ]
    }

    file { '/root/script/vncpasswd.sh':
        source => "puppet:///modules/dockerhost/script/vncpasswd.sh",
        mode => "0755",
    }

    file { '/root/script/vnc.sh':
        source => "puppet:///modules/dockerhost/script/vnc.sh",
        mode => "0755",
    }
}
