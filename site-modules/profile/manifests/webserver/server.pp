class profile::webserver::server {
    vcsrepo { '/home/ubuntu':
        ensure => present,
        provider => git,
        source => 'https://bitbucket.org/SteinarVrenne/website-repo.git',
        revision => 'master',
    }

    class { 'nodejs':
        manage_package_repo       => false,
        nodejs_dev_package_ensure => 'present',
        npm_package_ensure        => 'present',
    }

    nodejs::npm { 'serverapp':
        ensure           => 'present',
        target           => '/home/ubuntu/website-repo',
        use_package_json => true,   
        require => Vcsrepo['/home/ubuntu'],
        require => Class['::nodejs'],
    }
}