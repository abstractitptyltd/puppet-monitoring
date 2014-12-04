
class monitoring::host (
  $ensure              = $monitoring::ensure,
  $hostgroup           = undef,
  $sms_alerts          = $monitoring::sms_alerts,
  $notifications       = $monitoring::notifications,
  $monitoring_server   = $monitoring::monitoring_server,
  $monitoring_service  = $monitoring::monitoring_service,
  $host_name           = $monitoring::host_name,
  $host_ip             = $monitoring::host_ip,
  $host_groups         = $monitoring::host_groups,
  $parents             = $monitoring::parents,
  $host_type           = $monitoring::host_type,
  $host_alias          = $monitoring::host_alias,
  $check_period        = $monitoring::check_period,
  $notification_period = $monitoring::notification_period,) {
  include ::monitoring

  if is_array($host_groups) {
    if empty($hostgroup) {
      $host_groups_full = join($host_groups, ",")
    } else {
      $host_groups_full = join(concat(any2array($hostgroup), $host_groups), ',')
    }
  } else {
    if empty($hostgroup) {
      $host_groups_full = $host_groups
    } else {
      $host_groups_full = "${hostgroup},${host_groups}"
    }
  }

  @@nagios_host { $host_name:
    ensure              => $ensure,
    use                 => $host_type,
    alias               => $host_alias,
    address             => $host_ip,
    hostgroups          => $host_groups_full,
    parents             => $parents,
    contact_groups      => $sms_alerts ? {
      false => 'admins,linux_admins',
      true  => 'admins,linux_admins,linux_admin_sms'
    },
    notification_period => $notification_period,
    check_period        => $check_period,
    notify              => Class[$monitoring_service],
    tag                 => $monitoring_server,
  }

  if (is_string($hostgroup) and !empty($hostgroup)) {
    if !defined(Monitoring::Hostgroup[$hostgroup]) {
      monitoring::hostgroup { $hostgroup:
      # ensure => $ensure,
      }
    }
  }

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
