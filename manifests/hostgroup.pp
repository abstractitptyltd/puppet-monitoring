
define monitoring::hostgroup ($ensure = 'present', $host_alias = undef) {

  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service
  $monitoring_server = $monitoring::params::monitoring_server

  @@nagios_hostgroup { $name:
    ensure         => $ensure,
    hostgroup_name => $name,
    alias          => $host_alias,
    notify         => Class[$monitoring_service],
    tag            => $monitoring_server,
  }

}
