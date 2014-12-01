
class monitoring::service::route ( $ensure = 'present', $host_name = $fqdn, $service_type = 'standard_service', $notifications = true ) {
  include ::monitoring

  monitoring::service { 'route':
    ensure                => $ensure,
    service_description   => 'Route',
    servicegroups         => 'net',
    check_command         => "check_route!${::monitoring::host_ip}",
    contact_groups        => 'admins',
    notifications         => $notifications ? { default => undef, false => 0 },
  }
}
