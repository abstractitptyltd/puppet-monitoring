define monitoring::service (
  $ensure                = hiera('monitoring::ensure', 'present'),
  $servicegroups,
  $check_command,
  $service_description,
  $service_type          = 'standard_service',
  $notifications         = hiera('monitoring::notifications', true),
  $sms_alerts            = hiera('monitoring::sms_alerts', true),
  $contact_groups        = 'admins',
  $sms_contact_groups    = '',
  $register              = 1,
  $host_name             = hiera('monitoring::host_name', $fqdn),
  $max_check_attempts    = undef,
  $notification_options  = undef,
  $normal_check_interval = undef,
  $retry_check_interval  = undef,
  $notification_interval = undef,) {
  include ::monitoring
  $host_type          = $::monitoring::host_type
  $monitoring_service = $::monitoring::monitoring_service
  $monitoring_server  = $::monitoring::monitoring_server
  $real_sms_group     = $sms_contact_groups ? {
    ''      => $contact_groups,
    default => "${contact_groups},${sms_contact_groups}"
  }

  @@nagios_service { "${host_name}_${name}":
    ensure                => $ensure,
    use                   => $service_type,
    host_name             => $host_name,
    service_description   => $service_description,
    servicegroups         => $servicegroups,
    check_command         => $check_command,
    contact_groups        => $sms_alerts ? {
      false => $contact_groups,
      true  => $real_sms_group
    },
    notifications_enabled => $notifications ? {
      default => undef,
      false   => 0
    },
    max_check_attempts    => $max_check_attempts,
    normal_check_interval => $normal_check_interval,
    notification_interval => $notification_interval,
    retry_check_interval  => $retry_check_interval,
    notification_options  => $notification_options,
    register              => $register,
    notify                => Class[$monitoring_service],
    tag                   => $monitoring_server,
  }
}
