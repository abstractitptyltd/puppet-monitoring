
class monitoring::host {
  include monitoring::params
  $ensure = $monitoring::params::ensure
  $sms_alerts = $monitoring::params::sms_alerts
  $notifications = $monitoring::params::notifications
  $monitoring_server = $monitoring::params::monitoring_server
  $monitoring_service = $monitoring::params::monitoring_service
  $host_name = $monitoring::params::host_name
  $host_ip = $monitoring::params::host_ip
  $host_groups = $monitoring::host::host_groups
  $parents = $monitoring::params::parents
  $host_type = $monitoring::params::host_type
  $host_alias = $monitoring::params::host_alias
  $notification_period = $monitoring::params::notification_period
  #  $host_groups = $location ? { default => "${location},${nagios_host_groups}", testing => $nagios_host_groups }

  @@nagios_host { $host_name:
    ensure => $ensure,
    use => $host_type,
    alias => $host_alias,
    address => $host_ip,
    hostgroups => $host_groups,
    parents => $parents,
    contact_groups => $nagios_sms_alerts ? { false => "admins,linux_admins", true => "admins,linux_admins,linux_admin_sms" },
    notification_period => $notification_period,
    check_period => $nagios_timeperiod,
    notify => Class[$monitoring_service],
    tag => $monitoring_server,
  }

  #  include nrpe
  #  include monitoring::install
  #  include monitoring::scripts # move these into the specific plugins that need them
  include monitoring::service::ping
  include monitoring::service::users
  include monitoring::service::total_procs
  include monitoring::service::disk
  include monitoring::service::memory
  include monitoring::service::load
  include monitoring::service::swap
  include monitoring::service::updates
  include monitoring::service::reboot

}
