
class monitoring::service::memory {
  include monitoring::params
  $nagios_extra_plugins = $monitoring::params::nagios_extra_plugins

  monitoring::service { "memory":
    service_description    => 'MEMORY',
    servicegroups      => 'system',
    check_command      => 'check_nrpe!check_memory',
    contact_groups      => 'admins',
  }
  monitoring::servicedependency { "memory":
    dependent_service_description  => 'MEMORY',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'memory':
    ensure      => $ensure,
    plugin      => 'extra',
    check_command  => 'check_memory.pl -w 5% -c 2%',
    notify      => Class['nrpe::service'],
  }

  file { 'scripts_check_memory':
    ensure  => $ensure,
    name  => "${nagios_extra_plugins}/check_memory.pl",
    mode  => 755,
    owner  => root,
    group  => root,
    content  => template('monitoring/scripts/check_memory.pl.erb'),
  }

}
