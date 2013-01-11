
class monitoring::service::reboot {
  include monitoring::params
  $nagios_extra_plugins = $monitoring::params::nagios_extra_plugins

  monitoring::service { "reboot":
    service_type => 'passive_service',
    service_description => 'REBOOT',
    servicegroups => 'system',
    check_command => 'check_nrpe!check_dummy',
    max_check_attempts => 1,
    notification_options => 'w',
    contact_groups => 'admins,linux_admins',
    contact_groups_sms => 'linux_admin_sms', 
  }
  file { '/etc/cron.d/reboot_alert':
    ensure  => $ensure,
    content  => "@reboot root perl $nagios_extra_plugins/server_reboot_alert.pl --nagiosname=$nagios_host_name",
    owner  => root,
    group  => root,
    mode  => 644,
  }
  file { 'scripts_server_reboot_alert':
    ensure  => $nagios_ensure,
    name  => "${nagios_extra_plugins}/server_reboot_alert.pl",
    mode  => 755,
    owner  => root,
    group  => root,
    content  => template('monitoring/scripts/server_reboot_alert.pl.erb'),
  }

}
