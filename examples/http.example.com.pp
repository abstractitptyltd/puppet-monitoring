node "http.example.com" {
  # # this pulls in nrpe and the base monitoring services
  include monitoring

  # this sets up a service for monitroing apache
  # this gets exported to the monitoring server set via the ::monitoring::monitoring_server variable
  # set the ::monitoring::monitoring_service variable to the class that manages the service for that server
  # the hostname is automagically set in the monitoring class
  monitoring::service { "http_daemon":
    service_description => 'DAEMON HTTP',
    servicegroups       => 'http,important_email',
    check_command       => 'check_nrpe!check_http_daemon',
    sms_alerts          => true, # # this tells your monitoring server to send sms alerts
    contact_groups      => 'admins,web_admins',
    sms_contact_groups  => 'web_admin_sms', # this group gets added to the contact_groups if sms_alerts are set
  }

  # # setup a nrpe plugin for monitoring the apache daemon
  # this gets setup on the node so the monitoring::service above can check it
  nrpe::plugin { 'http_daemon':
    sudo          => true, # this runs the check with sudo, currently you need to setup the rules manually, that will change as soon
    # as i release my sudo module :)
    plugin        => 'extra', # the script lives in the directory defined in the monitoring::nagios_extra_plugins var in hiera
    check_command => "check_daemon httpd --label httpd -H :::/443 -n 5:30 -c sockets=0:150",
  # the command that gets run. the
  # directory and sudo will get added to
  # the front of the command
  }

  monitoring::service { "https_${fqdn}":
    service_description => "HTTPS ${fqdn}",
    servicegroups       => 'http,important_sms',
    check_command       => "check_https!${fqdn}!${ipaddress}",
    sms_alerts          => true,
    contact_groups      => 'admins,web_admins',
    sms_contact_groups  => 'web_admin_sms',
  }

  monitoring::service { "sslcert_${fqdn}":
    service_description => "SSL ${fqdn}",
    servicegroups       => 'http,important_email',
    check_command       => "check_http_ssl_cert!${fqdn}!${ipaddress}",
    contact_groups      => 'admins',
  }

}
