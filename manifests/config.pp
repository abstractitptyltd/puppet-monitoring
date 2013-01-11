
class monitoring::config {

  include monitoring::params
  $nagios_extra_plugins = $monitoring::params::nagios_extra_plugins
  file { '/etc/nagios':
    ensure => directory,
    owner => root,
    group => root,
    mode => 755,
  }
  file { $nagios_extra_plugins:
    ensure => directory,
    owner => root,
    group => root,
    mode => 755,
  }
/*
  file { $send_nsca_cfg:
    owner => root,
    group => root,
    mode => 644,
    content => template("monitoring/send_nsca.cfg.erb"),
  }

  # want to stop using this
  file { 'monitoringconf':
    name => $osfamily ? { RedHat => '/etc/sysconfig/monititoring', Debian => '/etc/default/monitoring'},
    owner => root,
    group => root,
    mode => 644,
    content => template("monitoring/config.sh.erb"),
  }
*/

}

