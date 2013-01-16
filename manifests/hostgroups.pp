class monitoring::hostgroups {
  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  nagios_hostgroup { "network_hardware":
    hostgroup_name => "network_hardware",
    alias => "Routers and Switches",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "printers":
    hostgroup_name => "printers",
    alias => "Printers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "backup":
    hostgroup_name => "backup",
    alias => "Backup Servers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "virtual":
    hostgroup_name => "virtual",
    alias => "Virtual Servers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "web":
    hostgroup_name => "web",
    alias => "Web Servers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "email":
    hostgroup_name => "email",
    alias => "Email Servers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "dns":
    hostgroup_name => "dns",
    alias => "DNS Servers",
    notify => Class[$monitoring_service],
  }

  nagios_hostgroup { "database":
    hostgroup_name => "database",
    alias => "Database Servers",
    notify => Class[$monitoring_service],
  }

}
