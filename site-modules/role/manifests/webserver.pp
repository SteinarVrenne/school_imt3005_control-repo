class role::webserver {
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::dns::server
  include ::profile::consul::server
  include ::profile::webserver::server
}
