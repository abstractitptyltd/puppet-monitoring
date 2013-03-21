
define monitoring::service::pop_detailed ( $ensure = present, $host_name = $fqdn, $check_host, $check_port = 110, $ssl = false, $service_type = 'standard_service', $notifications = true ) {
  include monitoring::params

  monitoring::service { "pop_${name}":
    ensure => $ensure,
    host_name => $host_name,
    service_description => "POP ${name}",
    servicegroups => 'email',
    check_command => "check_pop_detailed!${check_host}!${check_port}",
    contact_groups => 'admins,email_admins',
    sms_contact_groups => 'email_admin_sms',
    notifications => $notifications ? { default => undef, false => 0 },
  }
}
