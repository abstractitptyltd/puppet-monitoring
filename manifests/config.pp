
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

}

