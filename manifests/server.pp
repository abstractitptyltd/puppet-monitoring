
class monitoring::server ($ensure = 'present', $use_db = true, $nsca = '1', $www = '0') {

  include monitoring::templates
  include monitoring::commands
  include monitoring::contactgroups
  include monitoring::hostgroups
  include monitoring::servicegroups
  include monitoring::timeperiods
  include monitoring::params
  $host_name = $monitoring::params::host_name
  #  include monitoring::site # probably don't need to pull this in anymore since it gets pulled in below will just need to include it on the monitoring server node...

  file { ['/etc/nagios/nagios_host.cfg','/etc/nagios/nagios_hostgroup.cfg','/etc/nagios/nagios_hostescalation.cfg','/etc/nagios/nagios_hostdependency.cfg','/etc/nagios/nagios_service.cfg','/etc/nagios/nagios_servicegroup.cfg','/etc/nagios/nagios_serviceescalation.cfg','/etc/nagios/nagios_servicedependency.cfg','/etc/nagios/nagios_contact.cfg','/etc/nagios/nagios_contactgroup.cfg','/etc/nagios/nagios_timeperiod.cfg','/etc/nagios/nagios_command.cfg']:
    ensure => $ensure,
    owner => root,
    group => root,
    mode => 644,
  }

  Nagios_command <| |>
  Nagios_servicegroup <| |>
  Nagios_contactgroup <| |>
  Nagios_contact <| |>
  Nagios_hostgroup <| |>
  Nagios_hostescalation <| tag == $host_name |>
  Nagios_serviceescalation <| tag == $host_name |>
  Nagios_hostescalation <<| tag == $host_name |>>
  Nagios_serviceescalation <<| tag == $host_name |>>
  Nagios_host <| tag == $host_name |>
  Nagios_hostdependency  <| tag == $host_name |>
  Nagios_service <| tag == $host_name |>
  Nagios_servicedependency <| tag == $host_name |>
  Nagios_host <<| tag == $host_name |>>
  Nagios_hostdependency  <<| tag == $host_name |>>
  Nagios_service <<| tag == $host_name |>>
  Nagios_servicedependency <<| tag == $host_name |>>
  ## remove these after migrating everything
  /*
  Nagios_hostescalation <| tag == "nagios_${nagios_host_name}" |>
  Nagios_serviceescalation <| tag == "nagios_${nagios_host_name}" |>
  Nagios_hostescalation <<| tag == "nagios_${nagios_host_name}" |>>
  Nagios_serviceescalation <<| tag == "nagios_${nagios_host_name}" |>>
  Nagios_host <| tag == "nagios_${nagios_host_name}" |>
  Nagios_hostdependency  <| tag == "nagios_${nagios_host_name}" |>
  Nagios_service <| tag == "nagios_${nagios_host_name}" |>
  Nagios_servicedependency <| tag == "nagios_${nagios_host_name}" |>
  Nagios_host <<| tag == "nagios_${nagios_host_name}" |>>
  Nagios_hostdependency  <<| tag == "nagios_${nagios_host_name}" |>>
  Nagios_service <<| tag == "nagios_${nagios_host_name}" |>>
  Nagios_servicedependency <<| tag == "nagios_${nagios_host_name}" |>>
*/
  File <| tag == 'nagios_script' |>

}
