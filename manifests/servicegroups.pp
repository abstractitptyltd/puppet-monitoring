class monitoring::servicegroups {

  nagios_servicegroup { 'critical_sms':
    servicegroup_name  => 'critical_sms',
    alias        => 'Critical Services SMS'
  }

  nagios_servicegroup { 'important_sms':
    servicegroup_name  => 'important_sms',
    alias        => 'Important Services SMS'
  }

  nagios_servicegroup { 'important_email':
    servicegroup_name  => 'important_email',
    alias        => 'Important Services'
  }

  nagios_servicegroup { 'remoteaccess':
    servicegroup_name  => 'remoteaccess',
    alias        => 'Remote Access Services',
  }

  nagios_servicegroup { 'email':
    servicegroup_name  => 'email',
    alias        => 'Email Services',
  }

  nagios_servicegroup { 'db':
    servicegroup_name  => 'db',
    alias        => 'Database Services',
  }

  nagios_servicegroup { 'http':
    servicegroup_name  => 'http',
    alias        => 'Web Services',
  }

  nagios_servicegroup { 'system':
    servicegroup_name  => 'system',
    alias        => 'System Services',
  }

  nagios_servicegroup { 'net':
    servicegroup_name  => 'net',
    alias        => 'Network Services',
  }

  nagios_servicegroup { 'dns':
    servicegroup_name  => 'dns',
    alias        => 'Dns Services',
  }

  nagios_servicegroup { 'backup':
    servicegroup_name  => 'backup',
    alias        => 'Backup Services',
  }

  nagios_servicegroup { 'processing':
    servicegroup_name  => 'processing',
    alias        => 'Processing Services',
  }

}
