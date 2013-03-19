
class monitoring {
  include monitoring::params
  include monitoring::install
  include monitoring::config
  include nrpe
  include monitoring::host
  if ( $monitoring::params::host_name == $monitoring::params::monitoring_server ) {
    # this node is a monitoring server as well so include the server class
    include monitoring::server
    # note you have to include icinga or nagios manually for now
  }
}
