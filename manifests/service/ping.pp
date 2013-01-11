
class monitoring::service::ping {

  monitoring::service { "ping":
    service_description => 'PING',
    servicegroups => 'net',
    check_command => $location ? { 'office' => 'check_ping!75.0,40%!100.0,70%', default => 'check_ping!550.0,40%!750.0,70%' },
    contact_groups => 'admins',
  }
}
