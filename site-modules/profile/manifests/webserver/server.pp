class serverRepo {
    vcsrepo { '/home/ubuntu ':
        ensure => present,
        providet => git,
        source => 'https://bitbucket.org/Jimbob21148/control-repo.git'
        revision => 'testing'
    }
}