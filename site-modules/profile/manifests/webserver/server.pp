class profile::webserver::server {
    # Download the repo and ensure the latest version of the file is always the case
    vcsrepo { '/home/ubuntu/website-repo':
        ensure => latest,
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
    exec { '/home/ubuntu/website-repo/node_modules/.bin/webpack --mode production && /usr/bin/node /home/ubuntu/website-repo/src/server/index.js':
        path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ubuntu/website-repo/node_modules/.bin',
        user => 'root',
        require => Nodejs::Npm['serverapp'],
    }
}