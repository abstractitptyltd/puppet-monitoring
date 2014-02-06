
define monitoring::hostdependency ($ensure = 'present', $host_name, $inherits_parent = 1) {

  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service
  $monitoring_server = $monitoring::params::monitoring_server

  @@nagios_hostdependency { $name:
    ensure                        => $ensure,
    host_name                     => $host_name,
    inherits_parent               => $inherits_parent,
    execution_failure_criteria    => 'd,u,p',
    notification_failure_criteria => 'd,u,p',
    notify                        => Class[$monitoring_service],
    tag                           => $monitoring_server,
  }

}
