
define monitoring::net_device ( 
  $ensure = present,
  $host_ip,
  $host_parents = undef,
  $host_groups = 'network_hardware', 
  $host_alias = undef,
  $host_type = 'network_hardware',
  $timeperiod = undef,
  $ping_warn = '550.0,40%',
  $ping_crit = '750.0,70%',
  $notifications = true,
  $monitoring_server = hiera('monitoring::params::monitoring_server'),
) {

  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  if $notifications == false {
    $notifications_enabled = 0
  }

  @nagios_host { $name:
    ensure                => $ensure,
    use                   => 'net_device',
    alias                 => $host_alias,
    address               => $host_ip,
    hostgroups            => $host_groups,
    parents               => $host_parents,
    contact_groups        => 'admins,network_admins',
    notifications_enabled => bool2num($notifications),
    notification_period   => $timeperiod,
    check_period          => $timeperiod,
    notify                => Class[$monitoring_service],
    tag                   => $monitoring_server,
  }

  @nagios_service { "${name}_ping":
    ensure                => $ensure,
    use                   => 'standard_service',
    host_name             => $name,
    service_description   => 'PING',
    servicegroups         => 'net',
    check_command         => "check_ping!${ping_warn}!${ping_crit}",
    contact_groups        => 'admins',
    notifications_enabled => bool2num($notifications),
    notify                => Class[$monitoring_service],
    tag                   => $monitoring_server,
  }
/*
  @nagios_service { "${name}_route":
    ensure => absent,
    use => 'standard_service',
    host_name => $name,
    service_description => 'Route',
    servicegroups => 'net',
    check_command => "check_route!$host_ip",
    contact_groups => 'admins',
    notifications_enabled => bool2num($notifications),
    notify => Class[$monitoring_service],
    tag => $monitoring_server,
  }
*/
}
