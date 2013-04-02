
class monitoring::params (
  $ensure = present,
  $sms_alerts = true,
  $notifications = true,
  $monitoring_server,
  $monitoring_type, # ie icinga or nagios
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
  $sms_notify_script_name = 'notify_by_clickatell', # these only need to be set if sms_alerts are true
  $sms_notify_script_template = 'monitoring/scripts/notify_by_clickatell.pl.erb',
  $sms_host_notify_command_args = '-a $USER7$ -u $USER8$ -p $USER9$ -n "$NOTIFICATIONTYPE$" -w "$NOTIFICATIONAUTHOR$" -c "$NOTIFICATIONCOMMENT$" -m "$NOTIFICATIONTYPE$: $HOSTNAME$ is $HOSTSTATE$ ($HOSTOUTPUT$) for $HOSTDURATION$" -t $CONTACTPAGER$',
  $sms_notify_command_args = '-a $USER7$ -u $USER8$ -p $USER9$ -n "$NOTIFICATIONTYPE$" -w "$NOTIFICATIONAUTHOR$" -c "$NOTIFICATIONCOMMENT$" -m "$NOTIFICATIONTYPE$: $HOSTNAME$/$SERVICEDESC$ is $SERVICESTATE$ ($SERVICEOUTPUT$) for $SERVICEDURATION$" -t $CONTACTPAGER$',
) {
  validate_re($monitoring_type, '^(icinga|nagios)$',
  "${monitoring_type} is not supported for monitoring_type.
  Allowed values are 'icinga' and 'nagios'.")
  $monitoring_service = "${monitoring_type}::service"
  $monitoring_user = $monitoring_type

  $nagios_plugins = $architecture ? { 'x86_64' => '/usr/lib64/nagios/plugins', default => '/usr/lib/nagios/plugins'}
  $nagios_extra_plugins = hiera('monitoring::nagios_extra_plugins', $nagios_plugins)
  $total_procs_warn = hiera('monitoring::total_procs_warn', 250)
  $total_procs_crit = hiera('monitoring::total_procs_crit', 300)
  $mailq_warn = 100
  $mailq_crit = 300
}

