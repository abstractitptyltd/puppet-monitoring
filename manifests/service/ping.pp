
class monitoring::service::ping {
  include monitoring::params
  $ping_warn = $monitoring::params::ping_warn
  $ping_crit = $monitoring::params::ping_crit

  monitoring::service { "ping":
    service_description => 'PING',
    servicegroups => 'net',
    #    check_command => $location ? { 'office' => 'check_ping!75.0,40%!100.0,70%', default => 'check_ping!550.0,40%!750.0,70%' },
    check_command => "check_ping!${ping_warn}!${ping_crit}",
    contact_groups => 'admins',
  }
}
