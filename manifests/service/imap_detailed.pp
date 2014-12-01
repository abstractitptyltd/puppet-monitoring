
define monitoring::service::imap_detailed (
  $ensure        = 'present',
  $host_name     = $fqdn,
  $check_host,
  $check_port    = 143,
  $ssl           = false,
  $notifications = true) {
  include ::monitoring

  monitoring::service { "imap_${name}":
    ensure              => $ensure,
    host_name           => $host_name,
    service_description => "IMAP ${name}",
    servicegroups       => 'email',
    check_command       => "check_imap_detailed!${check_host}!${check_port}",
    contact_groups      => 'admins,email_admins',
    sms_contact_groups  => 'email_admin_sms',
    notifications       => $notifications ? {
      default => undef,
      false   => 0
    },
  }

}
