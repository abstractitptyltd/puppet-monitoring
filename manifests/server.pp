
class monitoring::server {
  include monitoring::templates
  include monitoring::commands
  include monitoring::contactgroups
  include monitoring::hostgroups
  include monitoring::servicegroups
  include monitoring::timeperiods
  include ::monitoring
  $host_name = $::monitoring::host_name

  file { [
    '/etc/nagios/nagios_host.cfg',
    '/etc/nagios/nagios_hostgroup.cfg',
    '/etc/nagios/nagios_hostescalation.cfg',
    '/etc/nagios/nagios_hostdependency.cfg',
    '/etc/nagios/nagios_service.cfg',
    '/etc/nagios/nagios_servicegroup.cfg',
    '/etc/nagios/nagios_serviceescalation.cfg',
    '/etc/nagios/nagios_servicedependency.cfg',
    '/etc/nagios/nagios_contact.cfg',
    '/etc/nagios/nagios_contactgroup.cfg',
    '/etc/nagios/nagios_timeperiod.cfg',
    '/etc/nagios/nagios_command.cfg']:
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
  }

  monitoring::script { $::monitoring::sms_notify_script_name:
    template => $::monitoring::sms_notify_script_template,
  }

  monitoring::command { 'host_notify_by_pager':
    command      => $::monitoring::sms_notify_script_name,
    command_args => $::monitoring::sms_host_notify_command_args,
    plugin_type  => 'extra',
    require      => Monitoring::Script[$::monitoring::sms_notify_script_name],
  }

  monitoring::command { 'notify_by_pager':
    command      => $::monitoring::sms_notify_script_name,
    command_args => $::monitoring::sms_notify_command_args,
    plugin_type  => 'extra',
    require      => Monitoring::Script[$::monitoring::sms_notify_script_name],
  }

  Nagios_command <| |>
  Nagios_command <<| |>>
  Nagios_servicegroup <| |>
  Nagios_servicegroup <<| |>>
  Nagios_contactgroup <| |>
  Nagios_contactgroup <<| |>>
  Nagios_contact <| |>
  Nagios_contact <<| |>>
  Nagios_hostgroup <| |>
  Nagios_hostgroup <<| tag == $host_name |>>
  Nagios_hostescalation <| tag == $host_name |>
  Nagios_serviceescalation <| tag == $host_name |>
  Nagios_hostescalation <<| tag == $host_name |>>
  Nagios_serviceescalation <<| tag == $host_name |>>
  Nagios_host <| tag == $host_name |>
  Nagios_hostdependency <| tag == $host_name |>
  Nagios_service <| tag == $host_name |>
  Nagios_servicedependency <| tag == $host_name |>
  Nagios_host <<| tag == $host_name |>>
  Nagios_hostdependency <<| tag == $host_name |>>
  Nagios_service <<| tag == $host_name |>>
  Nagios_servicedependency <<| tag == $host_name |>>

}
