
class monitoring::service::reboot {
  include ::monitoring
  $ensure               = $::monitoring::ensure
  $nagios_extra_plugins = $::monitoring::nagios_extra_plugins
  $host_name            = $::monitoring::host_name

  monitoring::service { 'reboot':
    service_type         => 'passive_service',
    service_description  => 'REBOOT',
    servicegroups        => 'system',
    check_command        => 'check_nrpe!check_dummy',
    max_check_attempts   => 1,
    notification_options => 'w',
    contact_groups       => 'admins,linux_admins',
    sms_contact_groups   => 'linux_admin_sms',
  }

  file { '/etc/cron.d/reboot_alert':
    ensure  => $ensure,
    content => "@reboot root perl ${nagios_extra_plugins}/server_reboot_alert.pl --nagiosname=${::monitoring::host_name}",
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  monitoring::script { 'server_reboot_alert.pl':
    template => 'monitoring/scripts/server_reboot_alert.pl.erb',
  }

}
