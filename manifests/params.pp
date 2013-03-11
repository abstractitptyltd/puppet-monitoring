
class monitoring::params (
  $ensure = present,
  $sms_alerts = true,
  $notifications = true,
  $monitoring_server,
  $monitoring_service,
  $host_name = $fqdn,
  $host_ip = $ipaddress,
  $host_groups = undef,
  $parents = undef,
  $host_type = 'linux_server',
  $host_alias = undef,
  $check_period = undef,
  $notification_period = undef,
  $ping_warn = '550.0,40%',
  $ping_crit = '750.0,70%',
) {
  $nagios_plugins = $architecture ? { 'x86_64' => '/usr/lib64/nagios/plugins', default => '/usr/lib/nagios/plugins'}
  $nagios_extra_plugins = hiera('monitoring::nagios_extra_plugins', $nagios_plugins)
  $total_procs_warn = hiera('monitoring::total_procs_warn', 250)
  $total_procs_crit = hiera('monitoring::total_procs_crit', 300)
  $mailq_warn = 100
  $mailq_crit = 300
}

