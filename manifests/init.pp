
class monitoring {
  include monitoring::params
  include monitoring::install
  include monitoring::config
  include nrpe
  include monitoring::host
  # this bit dosen't work.
  # please include monitoring::server on the nodes declared as a monitoring_server for now till I work out how to make it work automagically 
  # it's not including monitoring::server
  #if ( $monitoring::params::host_name == $monitoring::params::monitoring_server ) {
    # this node is a monitoring server as well so include the server class
    #  include monitoring::server
    # note you have to include icinga or nagios manually for now
  #}
}
