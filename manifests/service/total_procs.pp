
class monitoring::service::total_procs {
  include ::monitoring
  $total_procs_warn = $::monitoring::total_procs_warn
  $total_procs_crit = $::monitoring::total_procs_crit
  $ensure           = $::monitoring::ensure

  monitoring::service { 'total_procs':
    service_description => 'PROCS',
    servicegroups       => 'system',
    check_command       => 'check_nrpe!check_total_procs',
    contact_groups      => 'admins',
  }

  monitoring::servicedependency { 'total_procs':
    dependent_service_description => 'PROCS',
    service_description           => 'NRPE',
  }

  nrpe::plugin { 'total_procs':
    ensure        => $ensure,
    plugin        => 'main',
    check_command => 'check_procs',
    command_args  => "-w ${total_procs_warn} -c ${total_procs_crit}",
  }
}
