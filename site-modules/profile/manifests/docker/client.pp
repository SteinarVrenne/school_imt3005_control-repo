class profile::docker::client {

    # Include docker for these servers
    class { 'docker':
        version => 'latest',
    }
}