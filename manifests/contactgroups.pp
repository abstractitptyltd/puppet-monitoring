class monitoring::contactgroups {
  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

  nagios_contactgroup { 'escalation_second':
    contactgroup_name  => 'escalation_second',
    alias        => 'Escalation alerts second level',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { 'escalation_second_sms':
    contactgroup_name  => 'escalation_second_sms',
    alias        => 'Escalation alerts second level SMS',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { 'escalation_third':
    contactgroup_name  => 'escalation_third',
    alias        => 'Escalation alerts third level',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { 'escalation_third_sms':
    contactgroup_name  => 'escalation_third_sms',
    alias        => 'Escalation alerts third level SMS',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { 'escalation_fourth':
    contactgroup_name  => 'escalation_fourth',
    alias        => 'Escalation alerts fourth level',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { 'escalation_fourth_sms':
    contactgroup_name  => 'escalation_fourth_sms',
    alias        => 'Escalation alerts fourth level SMS',
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "admins":
    contactgroup_name  => "admins",
    alias        => "Nagios Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "devel":
    contactgroup_name  => "devel",
    alias        => "devel",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "bugzilla":
    contactgroup_name  => "bugzilla",
    alias        => "bugzilla",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "linux_admins":
    contactgroup_name  => "linux_admins",
    alias        => "Linux Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "linux_admin_sms":
    contactgroup_name  => "linux_admin_sms",
    alias        => "Linux Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "developers":
    contactgroup_name  => "developers",
    alias        => "Software Developers",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "developer_sms":
    contactgroup_name  => "developer_sms",
    alias        => "Software Developers SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "network_admins":
    contactgroup_name  => "network_admins",
    alias        => "Network Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "network_admin_sms":
    contactgroup_name  => "network_admin_sms",
    alias        => "Network Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "email_admins":
    contactgroup_name  => "email_admins",
    alias        => "Email Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "email_admin_sms":
    contactgroup_name  => "email_admin_sms",
    alias        => "Email Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "gateway_admins":
    contactgroup_name  => "gateway_admins",
    alias        => "Payment Gateway Admins",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "gateway_admin_sms":
    contactgroup_name  => "gateway_admin_sms",
    alias        => "Payment Gateway Admins SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "dns_admins":
    contactgroup_name  => "dns_admins",
    alias        => "DNS Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "dns_admin_sms":
    contactgroup_name  => "dns_admin_sms",
    alias        => "DNS Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "pbx_admins":
    contactgroup_name  => "pbx_admins",
    alias        => "PBX Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "pbx_admin_sms":
    contactgroup_name  => "pbx_admin_sms",
    alias        => "PBX Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "support_admins":
    contactgroup_name  => "support_admins",
    alias        => "Support Admins",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "support_admin_sms":
    contactgroup_name  => "support_admin_sms",
    alias        => "Support Admins SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "support":
    contactgroup_name  => "support",
    alias        => "Support Staff",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "support_sms":
    contactgroup_name  => "support_sms",
    alias        => "Support Staff SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "web_admins":
    contactgroup_name  => "web_admins",
    alias        => "Web Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "web_admin_sms":
    contactgroup_name  => "web_admin_sms",
    alias        => "Web Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "database_admins":
    contactgroup_name  => "database_admins",
    alias        => "Database Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "database_admin_sms":
    contactgroup_name  => "database_admin_sms",
    alias        => "Database Administrators SMS",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "windows_admins":
    contactgroup_name  => "windows_admins",
    alias        => "Windows Administrators",
    notify        => Class[$monitoring_service],
  }

  nagios_contactgroup { "windows_admin_sms":
    contactgroup_name  => "windows_admin_sms",
    alias        => "Windows Administrators SMS",
    notify        => Class[$monitoring_service],
  }

}
