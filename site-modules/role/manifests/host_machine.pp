class role::host_machine {
  include ::profile::base_linux
  include ::profile::consul::client
  include ::profile::dns::client
  include ::profile::docker::client
}
