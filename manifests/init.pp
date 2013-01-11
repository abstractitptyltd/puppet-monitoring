
class monitoring {
  include monitoring::params
  #  include monitoring::install
  include monitoring::config
  #  include monitoring::scripts
  include nrpe
  include monitoring::host
  if $monitoring::params::monitoring_server == $monitoring::params::nagios_host_name {
    include monitoring::server
    include icinga
  }
}
