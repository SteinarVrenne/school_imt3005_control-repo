class profile::webserver::server {
    vcsrepo { '/home/ubuntu ':
        ensure => present,
        provider => git,
        source => 'https://bitbucket.org/Jimbob21148/control-repo.git',
        revision => 'testing'
    }
}