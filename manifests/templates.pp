
class monitoring::templates {

  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  nagios_contact { 'sysadmin_pager':
    ensure              => present,
    register            => '0',
    service_notification_period    => '24x7',
    host_notification_period    => '24x7',
    service_notification_options  => 'w,u,c,r',
    host_notification_options    => 'd,u,r',
    service_notification_commands  => 'notify_by_pager',
    host_notification_commands    => 'host_notify_by_pager',
    can_submit_commands        => '1',
    retain_status_information    => '1',
    retain_nonstatus_information  => '1',
    notify              => Class[$monitoring_service],
  }

  nagios_contact { 'sysadmin_email':
    ensure              => present,
    register            => '0',
    service_notification_period    => '24x7',
    host_notification_period    => '24x7',
    service_notification_options  => 'w,u,c,r',
    host_notification_options    => 'd,u,r',
    service_notification_commands  => 'notify_by_email',
    host_notification_commands    => 'host_notify_by_email',
    can_submit_commands        => '1',
    retain_status_information    => '1',
    retain_nonstatus_information  => '1',
    notify              => Class[$monitoring_service],
  }

  nagios_contact { 'pager':
    ensure              => present,
    register            => '0',
    service_notification_period    => '24x7',
    host_notification_period    => '24x7',
    service_notification_options  => 'w,u,c,r',
    host_notification_options    => 'd,u,r',
    service_notification_commands  => 'notify_by_pager',
    host_notification_commands    => 'host_notify_by_pager',
    can_submit_commands        => '1',
    retain_status_information    => '1',
    retain_nonstatus_information  => '1',
    notify              => Class[$monitoring_service],
  }

  nagios_contact { 'email':
    ensure              => present,
    register            => '0',
    service_notification_period    => '24x7',
    host_notification_period    => '24x7',
    service_notification_options  => 'w,u,c,r',
    host_notification_options    => 'd,u,r',
    service_notification_commands  => 'notify_by_email',
    host_notification_commands    => 'host_notify_by_email',
    can_submit_commands        => '1',
    retain_status_information    => '1',
    retain_nonstatus_information  => '1',
    notify              => Class[$monitoring_service],
  }

  nagios_host { 'generic_host':
#    host_name          => 'generic_host',
    notifications_enabled    => '1',
    event_handler_enabled    => '1',
    flap_detection_enabled    => '1',
    failure_prediction_enabled  => '1',
    process_perf_data      => '1',
    retain_status_information  => '1',
    retain_nonstatus_information=> '1',
    notification_period      => '24x7',
    check_period        => '24x7',
    register          => '0',
    notify      => Class[$monitoring_service],
  }


  nagios_host { 'linux_server':
#    host_name        => 'linux_server',
    use            => 'generic_host',
    check_period      => '24x7',
    max_check_attempts    => '10',
    check_command      => 'check_host_alive',
    notification_interval  => $nagios_notify_interval,
    notification_options  => 'd,r',
    contact_groups      => 'admins',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'virtual_server':
#    host_name    => 'virtual_server',
    use        => 'linux_server',
    check_command  => 'check_virtual_host',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'osol_virtual_server':
#    host_name    => 'osol_virtual_server',
    use        => 'linux_server',
    check_command  => 'check_virtual_host',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'osol_server':
#    host_name    => 'osol_server',
    use        => 'linux_server',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'centos_server':
#    host_name    => 'centos_server',
    use        => 'linux_server',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'debian_server':
#    host_name    => 'debian_server',
    use        => 'linux_server',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'fedora_server':
#    host_name    => 'fedora_server',
    use        => 'linux_server',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'net_device':
#    host_name    => 'net_device',
    use        => 'linux_server',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'http_host':
#    host_name    => 'http_host',
    use        => 'linux_server',
    check_command  => 'check_http!$HOSTADDRESS',
    contact_groups  => 'admins,linux_admins',
    register    => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'passive_server':
#    host_name        => 'passive_server',
    use            => 'linux_server',
    active_checks_enabled  => '0',
    passive_checks_enabled  => '1',
    check_command      => 'check_nrpe!check_dummy',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_host { 'nonotify_server':
#    host_name        => 'nonotify_server',
    use            => 'linux_server',
    active_checks_enabled  => '1',
    passive_checks_enabled  => '1',
    notifications_enabled  => '0',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'generic_service':
    active_checks_enabled      => '1',
    passive_checks_enabled      => '1',
    parallelize_check        => '1',
    obsess_over_service        => '1',
    check_freshness          => '0',
    notifications_enabled      => '1',
    event_handler_enabled      => '1',
    flap_detection_enabled      => '1',
    failure_prediction_enabled    => '1',
    process_perf_data        => '1',
    retain_status_information    => '1',
    retain_nonstatus_information  => '1',
    is_volatile            => '0',
    register            => '0',
    notify      => Class[$monitoring_service],
  }


  nagios_service { 'standard_service':
    use            => 'generic_service',
    check_period      => '24x7',
    max_check_attempts    => '4',
    normal_check_interval  => '5',
    retry_check_interval  => '1',
    contact_groups      => 'admins',
    notification_options  => 'w,u,c,r',
    notification_interval  => $nagios_notify_interval,
    notification_period    => '24x7',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'local_service':
    use      => 'standard_service',
    register  => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'passive_service':
    use            => 'standard_service',
    active_checks_enabled  => '0',
    passive_checks_enabled  => '1',
    check_period      => 'none',
    check_freshness      => '0',
    freshness_threshold    => '900',
    obsess_over_service    => '0',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'noobsess_service':
    use            => 'generic_service',
    obsess_over_service    => '0',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'nonotify_service':
    use            => 'generic_service',
    notifications_enabled  => '0',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

  nagios_service { 'trap_service':
    use            => 'generic_service',
    max_check_attempts    => '1',
    normal_check_interval  => '1',
    retry_check_interval  => '1',
    notification_interval  => '31536000',
    check_command      => 'check_host_alive',
    is_volatile        => '1',
    register        => '0',
    notify      => Class[$monitoring_service],
  }

}
