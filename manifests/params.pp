
class monitoring::params (
  $ensure = present,
  $sms_alerts = true,
  $notifications = true,
  $monitoring_server,
  $monitoring_service = 'icinga::service',
  $host_name = $fqdn,
  $host_ip = $ipaddress,
  $host_groups = undef,
  $parents = undef,
  $host_type = 'linux_server',
  $host_alias = undef,
  $notification_period = undef,
  #  $nsca_password = hiera('monitoring::nsca_password'),
  #  $nsca_encryption = hiera('monitoring::nsca_encryption', '10')
) {
  $nagios_plugins = $architecture ? { 'x86_64' => '/usr/lib64/nagios/plugins', default => '/usr/lib/nagios/plugins'}
  $nagios_extra_plugins = hiera('monitoring::nagios_extra_plugins', $nagios_plugins)
  #  $send_nsca_cmd = '/usr/sbin/send_nsca'
/*
  case $osfamily {
    default: {
      $send_nsca_cfg = '/etc/nagios/send_nsca.cfg' 
    }
    Debian: {
      $send_nsca_cfg = '/etc/send_nsca.cfg' 
    }
  }
*/
}

