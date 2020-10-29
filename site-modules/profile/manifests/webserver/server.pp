class profile::webserver::server {
    # Download the repo 
    vcsrepo { '/home/ubuntu/website-repo':
        ensure => present,
        provider => git,
        source => 'https://bitbucket.org/SteinarVrenne/website-repo.git',
        revision => 'master',
    }

    # Make sure nodejs is installed on server
    class { 'nodejs':
        repo_url_suffix => '13.x',  
    }

    # Install node_modules needed for server operation
    nodejs::npm { 'serverapp':
        ensure           => 'present',
        target           => '/home/ubuntu/website-repo',
        use_package_json => true,   
        require => [ Vcsrepo['/home/ubuntu/website-repo'], Class['nodejs'] ],
    }

    # Start the server 
    exec { '/usr/bin/npm run build && /usr/bin/node src/server/index.js':
        path => '/home/ubuntu/website-repo',
        user => 'root',
        require => Nodejs::Npm['serverapp'],
    }
}