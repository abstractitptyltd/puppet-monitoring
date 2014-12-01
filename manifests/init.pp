
class monitoring (
  $ensure            = $monitoring::params::ensure,
  $sms_alerts        = $monitoring::params::sms_alerts,
  $notifications     = $monitoring::params::notifications,
  $monitoring_server = $monitoring::params::monitoring_server,
  $monitoring_type   = $monitoring::params::monitoring_type, # ie icinga or nagios
  $host_name         = $monitoring::params::host_name,
  $host_ip           = $monitoring::params::host_ip,
  $host_groups       = $monitoring::params::host_groups,
  $parents           = $monitoring::params::parents,
  $host_type         = $monitoring::params::host_type,
  $host_alias        = $monitoring::params::host_alias,
  $check_period      = $monitoring::params::check_period,
  $notification_period          = $monitoring::params::notification_period,
  $ping_warn         = $monitoring::params::ping_warn,
  $ping_crit         = $monitoring::params::ping_crit,
  $db_server         = $monitoring::params::db_server,
  $db_user           = $monitoring::params::db_user,
  $db_passsword      = undef,
  $db_port           = $monitoring::params::db_port,
  $sms_notify_script_name       = $monitoring::params::sms_notify_script_name, # these only need to be set if sms_alerts are true
  $sms_notify_script_template   = $monitoring::params::sms_notify_script_template,
  $sms_host_notify_command_args = $monitoring::params::sms_host_notify_command_args,
  $sms_notify_command_args      = $monitoring::params::sms_notify_command_args,
  $nagios_plugins    = $monitoring::params::nagios_plugins,
  $nagios_extra_plugins         = $monitoring::params::nagios_plugins,
  $total_procs_warn  = '250',
  $total_procs_crit  = '300',
  $mailq_warn        = '100',
  $mailq_crit        = '300',
  $nagios_notify_interval       = undef,) inherits monitoring::params {
  validate_re($monitoring_type, '^(icinga|nagios)$', "${monitoring_type} is not supported for monitoring_type.
  Allowed values are 'icinga' and 'nagios'.")
  $monitoring_service = "${monitoring_type}::service"
  $monitoring_user    = $monitoring_type

  include sudo
  #  include monitoring::params
  include monitoring::install
  include monitoring::config
  include nrpe
  include monitoring::host
  # this bit dosen't work.
  # please include monitoring::server on the nodes declared as a monitoring_server for now till I work out how to make it work
  # automagically
  # it's not including monitoring::server
  # if ( $monitoring::params::host_name == $monitoring::params::monitoring_server ) {
  # this node is a monitoring server as well so include the server class
  #  include monitoring::server
  # note you have to include icinga or nagios manually for now
  #}
}
