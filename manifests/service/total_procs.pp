
class monitoring::service::total_procs {
  include monitoring::params
  $total_procs_warn = $monitoring::params::total_procs_warn
  $total_procs_crit = $monitoring::params::total_procs_warn
  monitoring::service { "total_procs":
    service_description    => 'PROCS',
    servicegroups      => 'system',
    check_command      => 'check_nrpe!check_total_procs',
    contact_groups      => 'admins',
  }
  monitoring::servicedependency { "total_procs":
    dependent_service_description  => 'PROCS',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'total_procs':
    ensure      => $ensure,
    plugin      => 'main',
    check_command  => "check_procs -w ${total_procs_warn} -c ${total_procs_crit}",
    notify      => Class['nrpe::service'],
  }
}
