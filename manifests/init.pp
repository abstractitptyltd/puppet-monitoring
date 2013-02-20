
class monitoring {
  include monitoring::params
  #  include monitoring::install
  include monitoring::config
  #  include monitoring::scripts
  include nrpe
  include monitoring::host
}
