
class monitoring::service::load {
  monitoring::service { "load":
    service_description    => 'LOAD',
    servicegroups      => $nagios_host_type ? { 'nonotify_server' => 'system', default => 'system,important_sms' },
    check_command      => 'check_nrpe!check_load',
    contact_groups      => $nagios_sms_alerts ? { false => 'admins,linux_admins', true => 'admins,linux_admins,linux_admin_sms' },
  }
  monitoring::servicedependency { "load":
    dependent_service_description  => 'LOAD',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'load':
    ensure      => $ensure,
    plugin      => 'main',
    check_command  => 'check_load -w 15,10,5 -c 30,25,20',
    notify      => Class['nrpe::service'],
  }
}
