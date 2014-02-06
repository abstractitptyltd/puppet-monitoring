class monitoring::hostgroups {

  monitoring::hostgroup { 'network_hardware':
    alias => 'Routers and Switches',
  }

  monitoring::hostgroup { 'printers':
    alias => 'Printers',
  }

  monitoring::hostgroup { 'backup':
    alias => 'Backup Servers',
  }

  monitoring::hostgroup { 'virtual':
    alias => 'Virtual Servers',
  }

  monitoring::hostgroup { 'web':
    alias => 'Web Servers',
  }

  monitoring::hostgroup { 'email':
    alias => 'Email Servers',
  }

  monitoring::hostgroup { 'dns':
    alias => 'DNS Servers',
  }

  monitoring::hostgroup { 'database':
    alias => 'Database Servers',
  }

}
