# == Class: dockerhost
#
class dockerhost {
  # resources
  include dockerhost::images
  include dockerhost::scripts
}
