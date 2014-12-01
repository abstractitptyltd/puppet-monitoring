define monitoring::servicedependency (
  $ensure              = hiera('monitoring::ensure', 'present'),
  $host_name           = hiera('monitoring::host_name', $fqdn),
  $service_description,
  $dependent_host_name = hiera('monitoring::host_name', $fqdn),
  $dependent_service_description) {
  include ::monitoring
  $monitoring_server  = $::monitoring::monitoring_server
  $monitoring_service = $::monitoring::monitoring_service

  @@nagios_servicedependency { "${host_name}_${name}":
    ensure    => $ensure,
    dependent_host_name           => $dependent_host_name,
    dependent_service_description => $dependent_service_description,
    host_name => $host_name,
    service_description           => $service_description,
    execution_failure_criteria    => 'u,c,p',
    notification_failure_criteria => 'u,c,p',
    notify    => Class[$monitoring_service],
    tag       => $monitoring_server,
  }
}
