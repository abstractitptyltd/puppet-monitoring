
define monitoring::hostgroup (
  $ensure     = 'present',
  $host_alias = undef) {
  include ::monitoring
  $monitoring_service = $monitoring::monitoring_service
  $monitoring_server  = $monitoring::monitoring_server

  @@nagios_hostgroup { $name:
    ensure         => $ensure,
    hostgroup_name => $name,
    alias          => $host_alias,
    notify         => Class[$monitoring_service],
    tag            => $monitoring_server,
  }

}
