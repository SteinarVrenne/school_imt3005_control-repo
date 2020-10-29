node default {
  notify { "Oops Default! I'm ${facts['hostname']}": }
}

node /srv[1-12]?/ {
  include ::role::directory_server
}

node 'manager.node.consul' {
  include ::role::manager_server
}

node 'dir.node.consul' {
  include ::role::directory_server
}

node 'mon.node.consul' {
  include ::role::monitoring_server
}

node 'web.node.consul' {
  include ::role::webserver
}
