
class monitoring::service::swap {
  include monitoring::params

  monitoring::service { "swap":
    service_description    => 'SWAP',
    servicegroups      => 'system',
    check_command      => 'check_nrpe!check_swap',
    contact_groups      => 'admins',
  }
  monitoring::servicedependency { "swap":
    dependent_service_description  => 'SWAP',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'swap':
    ensure      => $ensure,
    plugin      => 'main',
    check_command  => 'check_swap',
    command_args  => '-w 40% -c 20%',
  }
}
