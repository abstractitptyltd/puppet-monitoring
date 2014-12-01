
class monitoring::service::users {
  include ::monitoring
  $ensure = $::monitoring::ensure

  monitoring::service { 'users':
    service_description => 'USERS',
    servicegroups       => 'system',
    check_command       => 'check_nrpe!check_users',
    contact_groups      => 'admins',
  }

  monitoring::servicedependency { 'users':
    dependent_service_description => 'USERS',
    service_description           => 'NRPE',
  }

  nrpe::plugin { 'users':
    ensure        => $ensure,
    plugin        => 'main',
    check_command => 'check_users',
    command_args  => '-w 15 -c 20',
  }
}
