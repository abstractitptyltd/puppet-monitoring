
class monitoring::service::disk {
  monitoring::service { 'disk':
    service_description => 'DISK',
    servicegroups       => 'system,important_email',
    check_command       => 'check_nrpe!check_disk',
    contact_groups      => 'admins,linux_admins',
    sms_contact_groups  => 'linux_admin_sms',
  }
  monitoring::servicedependency { 'disk':
    dependent_service_description => 'DISK',
    service_description           => 'NRPE',
  }
  nrpe::plugin { 'disk':
    plugin        => 'main',
    sudo          => true,
    check_command => 'check_disk',
    command_args  => '-w 20% -c 10% --all',
  }
}
