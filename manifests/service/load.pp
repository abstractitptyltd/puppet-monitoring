
class monitoring::service::load {
  monitoring::service { 'load':
    service_description => 'LOAD',
    servicegroups       => 'system,important_sms',
    check_command       => 'check_nrpe!check_load',
    contact_groups      => 'admins,linux_admins',
    sms_contact_groups  => 'admins,linux_admins,linux_admin_sms',
  }

  monitoring::servicedependency { 'load':
    dependent_service_description => 'LOAD',
    service_description           => 'NRPE',
  }

  nrpe::plugin { 'load':
    plugin        => 'main',
    check_command => 'check_load',
    command_args  => '-w 15,10,5 -c 30,25,20',
  }
}
