
class monitoring::params (
  $ensure = present,
  $sms_alerts = true,
  $notifications = true,
  $monitoring_server,
  $monitoring_type, # ie icinga or nagios
  $host_groups = undef,
  $parents = undef,
  $host_type = 'linux_server',
  $host_alias = undef,
  $check_period = undef,
  $notification_period = undef,
  $ping_warn = '550.0,40%',
  $ping_crit = '750.0,70%',
  $host_name = $fqdn,
  $host_ip = $ipaddress,
  $sms_notify_script_name = undef, # these only need to be set if sms_alerts are true
  $sms_notify_script_template = undef,
  $sms_host_notify_command_args = undef,
  $sms_notify_command_args = undef,
) {
  if $monitoring_type !~ /(icinga|nagios)/ {
    # $monitoring_type not set to icinga or nagios
    fail('monitoring::params::monitoring_type needs to be set to icinga or nagios')
  }
  $monitoring_service = "${monitoring_type}::service"
  $monitoring_user = $monitoring_type

  $nagios_plugins = $architecture ? { 'x86_64' => '/usr/lib64/nagios/plugins', default => '/usr/lib/nagios/plugins'}
  $nagios_extra_plugins = hiera('monitoring::nagios_extra_plugins', $nagios_plugins)
  $total_procs_warn = hiera('monitoring::total_procs_warn', 250)
  $total_procs_crit = hiera('monitoring::total_procs_crit', 300)
  $mailq_warn = 100
  $mailq_crit = 300
}

