define monitoring::script (
  $ensure = hiera('monitoring::params::ensure','present'),
  $template = undef,
  $file = undef,
  $script_type = 'template',
) {
  if ( $script_type == 'template' and $template == undef ) {
    fail('template needs template')
  }
  if ( $script_type == 'file' and $file == undef ) {
    fail('file needs file')
  }

  include monitoring::params
  $nagios_extra_plugins = $monitoring::params::nagios_extra_plugins

  file { $name:
    ensure       => $ensure,
    name         => "${nagios_extra_plugins}/${name}",
    mode         => '0755',
    owner        => root,
    group        => root,
    source       => $script_type ? {
      'file'       => $file,
      default      => undef
    },
    content      => $script_type ? {
      'template'   => template($template),
      default      => undef
    },
    require      => File[$nagios_extra_plugins],
  }
}
