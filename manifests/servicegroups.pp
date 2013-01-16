class monitoring::servicegroups {
  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  nagios_servicegroup { 'critical_sms':
    servicegroup_name => 'critical_sms',
    alias => 'Critical Services SMS',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'important_sms':
    servicegroup_name => 'important_sms',
    alias => 'Important Services SMS',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'important_email':
    servicegroup_name => 'important_email',
    alias => 'Important Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'remoteaccess':
    servicegroup_name => 'remoteaccess',
    alias => 'Remote Access Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'email':
    servicegroup_name => 'email',
    alias => 'Email Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'db':
    servicegroup_name => 'db',
    alias => 'Database Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'http':
    servicegroup_name => 'http',
    alias => 'Web Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'system':
    servicegroup_name => 'system',
    alias => 'System Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'net':
    servicegroup_name => 'net',
    alias => 'Network Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'dns':
    servicegroup_name => 'dns',
    alias => 'Dns Services',
    notify => Class[$monitoring_service],
  }

  nagios_servicegroup { 'backup':
    servicegroup_name => 'backup',
    alias => 'Backup Services',
    notify => Class[$monitoring_service],
  }

}
