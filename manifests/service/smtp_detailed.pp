
define monitoring::service::smtp_detailed (
  $ensure        = present,
  $host_name     = $fqdn,
  $check_host,
  $check_port    = 25,
  $ssl           = false,
  $notifications = true) {
  include ::monitoring

  monitoring::service { "smtp_${name}":
    ensure              => $ensure,
    host_name           => $host_name,
    service_description => "SMTP ${name}",
    servicegroups       => 'email',
    check_command       => "check_smtp_detailed!${check_host}!${check_port}",
    contact_groups      => 'admins,email_admins',
    sms_contact_groups  => 'email_admin_sms',
    notifications       => $notifications ? {
      default => undef,
      false   => 0
    },
  }

}
