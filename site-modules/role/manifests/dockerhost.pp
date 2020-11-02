class role::dockerhost {
  include ::manifests::base_linux
  include ::profile::consul::client
  include ::profile::dns::client
  include ::profile::docker::client
}
