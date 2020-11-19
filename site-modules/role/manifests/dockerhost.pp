class role::dockerhost {
  include ::profile::base_linux
  include ::profile::consul::client
  include ::profile::dns::client
  include ::profile::docker::client
  include ::profile::dockerhost::scripts
  include ::profile::dockerhost::images
}
