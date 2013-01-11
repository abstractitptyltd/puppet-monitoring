
class monitoring::service::updates {
  include monitoring::params

  monitoring::service { "updates":
    service_description => 'UPDATES',
    servicegroups => 'system',
    check_command => 'check_nrpe!check_updates',
    normal_check_interval => 1440,
    notification_interval=> 1440,
    retry_check_interval => 720,
    contact_groups => 'admins,linux_admins',
  }
  monitoring::servicedependency { "updates":
    dependent_service_description  => 'UPDATES',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'updates':
    ensure => $ensure,
    plugin => $operatingsystem ? { default => 'main', /(Debian|Ubunutu)/ => 'main' },
    check_command => $operatingsystem ? { default => 'check_updates -t 120 --no-boot-check --security-only', /(Debian|Ubuntu)/ => 'check_apt -t 120' },
    sudo => $operatingsystem ? { default => false, /(Debian|Ubuntu)/ => true },
  }
}
