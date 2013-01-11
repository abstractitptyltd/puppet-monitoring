
class monitoring::service::postfix {
  include monitoring::params
  $mailq_warn = $monitoring::params::mailq_warn
  $mailq_crit = $monitoring::params::mailq_crit

  include monitoring::plugin::check_daemon

  monitoring::service { "mailq":
    service_description => 'MAILQ',
    servicegroups => 'email',
    check_command => 'check_nrpe!check_mailq',
    contact_groups => 'admins',
  }
  monitoring::servicedependency { "mailq":
    dependent_service_description => 'MAILQ',
    service_description => 'NRPE',
  }
  nrpe::plugin { 'mailq':
    plugin => 'main',
    check_command => "check_mailq -M postfix -w ${mailq_warn} -c ${mailq_crit}",
  }
  monitoring::service { "postfix_daemon":
    service_description    => 'DAEMON POSTFIX',
    servicegroups      => 'email',
    check_command      => 'check_nrpe!check_postfix_daemon',
    contact_groups      => 'admins',
  }
  monitoring::servicedependency { "postfix_daemon":
    dependent_service_description  => 'DAEMON POSTFIX',
    service_description        => 'NRPE',
  }
  nrpe::plugin { 'postfix_daemon':
    plugin => 'extra',
    sudo => true,
    check_command  => 'check_daemon /usr/libexec/postfix/master --label postfix -p 25/tcp -n 1:1 -c sockets=0:100',
  }
}
