class profile::webserver::server {
    vcsrepo { '/home/ubuntu/website-repo':
        ensure => present,
        provider => git,
        source => 'https://bitbucket.org/SteinarVrenne/website-repo.git',
        revision => 'master',
    }

    class { 'nodejs':
        repo_url_suffix => '13.x',  
    }

    nodejs::npm { 'serverapp':
        ensure           => 'present',
        target           => '/home/ubuntu/website-repo',
        use_package_json => true,   
        require => [ Vcsrepo['/home/ubuntu/website-repo'], Class['nodejs'] ],
    }
}