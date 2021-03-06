define monitoring::command (
  $command,
  $command_args,
  $ensure      = hiera('monitoring::ensure', 'present'),
  $plugin_type = 'main',
  $sudo        = false,) {
  include ::monitoring
  $monitoring_user      = $::monitoring::monitoring_user
  $monitoring_service   = $::monitoring::monitoring_service
  $nagios_plugins       = $::monitoring::nagios_plugins
  $nagios_extra_plugins = $::monitoring::nagios_extra_plugins

  $command_line         = inline_template('<% if sudo == true %>/usr/bin/sudo <% end %><% if plugin_type == "none" %><% elsif plugin_type == "main" %>$USER1$/<% else %>$USER5$/<% end %><%= command %> <%= command_args %>'
  )

  case $plugin_type {
    default : {
      $sudo_command = "${nagios_extra_plugins}/${command}"
    }
    'main'  : {
      $sudo_command = "${nagios_plugins}/${command}"
    }
  }

  @nagios_command { $name:
    command_name => $name,
    command_line => $command_line,
    notify       => Class[$monitoring_service],
  }

  if $sudo == true {
    if !defined(Sudo::Rule["monitoring_${plugin_type}_${command}"]) {
      sudo::rule { "monitoring_${plugin_type}_${command}":
        ensure   => $ensure,
        who      => $monitoring_user,
        commands => $sudo_command,
        nopass   => true,
      }
    }
  }

}
