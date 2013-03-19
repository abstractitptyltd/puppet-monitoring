define monitoring::command (
  $ensure = hiera('monitoring::params::ensure','present'),
  $command,
  $command_args,
  $plugin_type = 'main',
  $sudo = false,
) {

  include monitoring::params
  $monitoring_user = $monitoring::params::monitoring_user
  $monitoring_service = $monitoring::params::monitoring_service
  $nagios_plugins = $monitoring::params::nagios_plugins
  $nagios_extra_plugins = $monitoring::params::nagios_extra_plugins

  $command_line = inline_template('<% if sudo == true %>/usr/bin/sudo <% end %><% if plugin_type == "none" %><% elsif plugin_type == "main" %>$USER1$/<% else %>$USER5$/<% end %><%= command %> <%= command_args %>')

  @nagios_command { $name:
    command_name => $name,
    command_line => $command_line,
    notify => Class[$monitoring_service],
  }

  if $sudo == true {
    if ! defined(Sudo::Rule["monitoring_${plugin_type}_${command}"]) {
      sudo::rule { "monitoring_${plugin_type}_${command}":
        ensure => $ensure,
        who => $monitoring_user,
        commands => $plugin_type ? { "main" => "${nagios_plugins}/${command}", default => "${nagios_extra_plugins}/${command}" },
        nopass => true,
      }
    }
  }

}
