
class monitoring::service::mysql {
  include monitoring::params
  include monitoring::plugin::check_daemon
  $db_server = $monitoring::params::db_server
  $db_user = $monitoring::params::db_user
  $db_pass = $monitoring::params::db_pass
  $db_port = $monitoring::params::db_port

  ## the mysql user will have to be created by hand for now
  $mysqld = $osfamily ? { default => '/usr/libexec/mysqld', Debian => '/usr/sbin/mysqld' }

  monitoring::service { "mysql":
    service_description => 'MYSQL',
    servicegroups => $monitoring::params::host_type ? { 'nonotify_server' => 'db', default => 'db,important_sms' },
    check_command => 'check_nrpe!check_mysql',
    contact_groups => 'admins,database_admins',
    sms_contact_groups => 'admins,database_admin_sms',
  }
  monitoring::servicedependency { "mysql":
    dependent_service_description => 'MYSQL',
    service_description => 'NRPE',
  }
  nrpe::plugin { 'mysql':
    plugin => 'extra',
    check_command => "check_mysqld",
    command_args => "-u ${db_user} -p ${db_pass} -H ${db_server} -P ${db_port} -w ,,40,,, -c ,,100,,, -a threads_connected,threads_cached,threads_running,questions,slow_queries,open_tables -A threads_connected,threads_cached,threads_running,questions,slow_queries,open_tables,com_select,com_update,com_insert,com_insert_select,com_commit,com_delete,com_rollback,bytes_received,bytes_sent,qcache_hits,qcache_inserts,qcache_not_cached,questions",
    require => Monitoring::Script['check_mysqld'],
  }

  monitoring::service { "mysql_daemon":
    service_description => 'DAEMON MYSQL',
    servicegroups => $monitoring::params::host_type ? { 'nonotify_server' => 'db', default => 'db,important_sms' },
    check_command => 'check_nrpe!check_mysqld_daemon',
    contact_groups => 'admins,database_admins',
    sms_contact_groups => 'database_admin_sms',
  }
  monitoring::servicedependency { "mysql_daemon":
    dependent_service_description => 'DAEMON MYSQL',
    service_description => 'NRPE',
  }
  nrpe::plugin { 'mysqld_daemon':
    sudo => true,
    plugin => 'extra',
    check_command => "check_daemon",
    command_args => $db_server ? { default => "${mysqld} -p ${db_port}/tcp -H 127.0.0.1/${db_port} -n 1:1 -c sockets=0:100", 'localhost' => "${mysqld} -n 1:1 -c sockets=0:100" },
  }
  monitoring::script { 'check_mysqld':
    template => "monitoring/scripts/check_mysqld.pl.erb",

  monitoring::service { "mysql_connections":
    service_description => 'MYSQL connections',
    servicegroups => $monitoring::params::host_type ? { 'nonotify_server' => 'db', default => 'db,important_sms' },
    check_command => 'check_nrpe!check_mysql_connections',
    contact_groups => 'admins,database_admins',
    sms_contact_groups => 'database_admin_sms',
  }
  monitoring::servicedependency { "mysql_connections":
    dependent_service_description => 'MYSQL connections',
    service_description => 'NRPE',
  }
  nrpe::plugin { 'mysql_connections':
    plugin => 'extra',
    check_command => "check_mysql_connections",
    command_args => "-u ${db_user} -p ${db_pass} -w 50% -c 80% -H ${db_server} -P ${db_port}",
    require => Monitoring::Script['check_mysql_connections'],
  }
  }
  monitoring::script { 'check_mysql_connections':
    template => 'monitoring/scripts/check_mysql_connections.erb',
  }
  package { 'perl-DBD-MySQL':
    name => $osfamily ? { Redhat => "perl-DBD-MySQL", Debian => "libdbd-mysql-perl" },
    ensure => installed,
  }

}
