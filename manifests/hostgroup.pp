
define monitoring::hostgroup ($ensure = 'present', $host_alias) {

  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  @@nagios_hostgroup { $name:
    ensure         => $ensure,
    hostgroup_name => $name,
    alias          => $host_alias,
    notify         => Class[$monitoring_service],
    tag            => $monitoring_server,
  }

}
