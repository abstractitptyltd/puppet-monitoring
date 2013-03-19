
class monitoring::commands {
  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

monitoring::command { "check_local_disk":
  command => 'check_disk',
  command_args => '-w $ARG1$ -c $ARG2$ -p $ARG3$',
}

monitoring::command { "check_smb_disk":
  command => "check_disk_smb",
  command_args => '-w $ARG1$ -c $ARG2$ -H $ARG3$ -s $ARG4$ -u $ARG5$ -p $ARG6$',
}

monitoring::command { "check_nrpe_status":
  command => "check_nrpe",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}

monitoring::command { "check_nrpe":
  command => "check_nrpe",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -c $ARG1$',
}

monitoring::command { "check_nrpe_other":
  command => "check_nrpe",
  command_args => '-t $USER3$ -H $ARG1$ -c $ARG2$',
}

monitoring::command { "check_nfs":
  command => "check_rpc",
  command_args => '-t $USER3$ -H $ARG1$ -C nfs',
}

monitoring::command { "check_local_load":
  command => "check_load",
  command_args => '-w $ARG1$ -c $ARG2$',
}

monitoring::command { "check_local_swap":
  command => "check_swap",
  command_args => '-w 50% -c 20%',
}

monitoring::command { "check_local_memory":
  command => "check_memory.pl",
  command_args => '-w 10% -c 5%',
  plugin_type => 'extra',
}

monitoring::command { "check_total_local_procs":
  command => "check_procs",
  command_args => '-w $ARG1$ -c $ARG2$',
}

monitoring::command { "check_local_procs":
  command => "check_procs",
  command_args => '-w $ARG1$ -c $ARG2$ -C $ARG3$',
}

monitoring::command { "check_local_users":
  command => "check_users",
  command_args => '-w $ARG1$ -c $ARG2$',
}

monitoring::command { "check_ups":
  command => "check_apc",
  command_args => 'bcharge 50 10',
}

monitoring::command { "check_dns":
  command => "check_dns",
  command_args => '-t $USER3$ -s $HOSTADDRESS$ -H $ARG1$',
}

monitoring::command { "check_dns_ip":
  command => "check_dns",
  command_args => '-t $USER3$ -s $HOSTADDRESS$ -H $ARG1$ -a $ARG2$',
}

monitoring::command { "check_dnszone":
  command => "check_dns",
  command_args => '-t $USER3$ -H $ARG1$ -a $ARG2$',
  notify => Class[$monitoring_service],
}

monitoring::command { "check_ext_dnszone":
  command => "check_dns",
  command_args => '-t $USER3$ -s $ARG1$ -H $ARG2$  -a $ARG3$',
}

monitoring::command { "check_dns_server":
  command => "check_dns",
  command_args => '-t $USER3$ -s $ARG1$ -H $ARG2$',
}

monitoring::command { "check_ssh":
  command => "check_ssh",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
}

monitoring::command { "check_rdp":
  command => "check_tcp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -p 3389',
}


monitoring::command { "check_ftp":
  command => "check_ftp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}



monitoring::command { "check_hpjd":
  command => "check_hpjd",
  command_args => '-H $HOSTADDRESS$ $ARG1$',
}


monitoring::command { "check_snmp":
  command => "check_snmp",
  command_args => '-H $HOSTADDRESS$ $ARG1$',
}

/*
monitoring::command { "check_cisco":
  ensure => absent,
  command => "check_cisco.pl",
  command_args => '-h $HOSTADDRESS$ -c $ARG1$ -i $ARG2$',
  plugin_type => 'extra',
}
*/
/*
monitoring::command { "check_snmp_netint":
  ensure => absent,
  command => "check_snmp_netint.pl",
  command_args => '$USER5$/check_snmp_netint.pl -H $HOSTADDRESS$ $ARG1$',
  notify => Class[$monitoring_service],
}
*/

monitoring::command { "check_http":
  command => "check_http",
  command_args => '-t $USER3$ -H $ARG1$ -u /$ARG2$',
}


monitoring::command { "check_https":
  command => "check_http",
  command_args => '-t $USER3$ -H $ARG1$ -I $ARG2$ -u /$ARG3$ -S -w 60 -c 120',
}


monitoring::command { "check_http_ssl_cert":
  command => "check_http",
  command_args => '-t $USER3$ -H $ARG1$ -I $ARG2$ -u /$ARG3$ -S -C 7',
}


monitoring::command { "check_http_cert":
  command => "check_http",
  command_args => '-t $USER3$ -H $ARG1$ -u /$ARG2$ -S',
}


monitoring::command { "check_nntp":
  command => "check_nntp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}



monitoring::command { "check_ping":
  command => "check_ping",
  command_args => '-H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 5',
}


monitoring::command { "check_icmp":
  command => "check_icmp",
  command_args => '-H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -n 5',
  sudo => true,
}

monitoring::command { "check_route":
  command => "check_traceroute",
  command_args => '$ARG1$',
  plugin_type => 'extra',
}

/*
monitoring::command { "check_xen":
  ensure => absent,
  command => "check_xen",
  command_args => '-H $HOSTNAME$',
}
*/
/*
monitoring::command { "check_dbserver":
  ensure => absent,
  command => "check_nrpe",
  command_args => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$ -c check_dbserver',
  notify => Class[$monitoring_service],
}

monitoring::command { "check_mmsserver":
  ensure => absent,
  command => "check_mmsserver",
  command_args => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$ -c check_mmsserver',
  notify => Class[$monitoring_service],
}
*/

monitoring::command { "check_mailq":
  command => "check_mailq",
  command_args => '-M $ARG1$ -w $ARG2$ -c $ARG3$',
}

monitoring::command { "check_jabber":
  command => "check_jabber",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -e "$ARG1$"',
}

monitoring::command { "check_pop":
  command => "check_pop",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}

monitoring::command { "check_pop_detailed":
  ## arg1 host arg2 port
  command => "check_pop",
  command_args => '-t $USER3$ -H $ARG1$ -p $ARG2$',
}

monitoring::command { "check_imap":
  command => "check_imap",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}

monitoring::command { "check_imap_detailed":
  ## arg1 host arg2 port
  command => "check_imap",
  command_args => '-t $USER3$ -H $ARG1$ -p $ARG2$',
}

monitoring::command { "check_smtp_detailed":
  ## arg1 host arg2 port
  command => "check_smtp",
  command_args => '-t $USER3$ -H $ARG1$ -p $ARG2$',
}

monitoring::command { "check_smtp":
  command => "check_smtp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$',
}

monitoring::command { "check_smtps":
  command => "check_smtp",
  command_args => '-p 465 -t $USER3$ -H $HOSTADDRESS$',
}

monitoring::command { "check_smtp_auth":
  command => "check_smtp",
  command_args => '-A LOGIN -S -D 5 -t $USER3$ -H $HOSTADDRESS$ -U $ARG1$ -P "$ARG2$"',
}

/*
monitoring::command { "check_email_delivery":
  command => "check_email_delivery",
  command_args => '-w 60 -c 120 --verbose -p "$USER5$/check_smtp_send -H $ARG1$ --mailfrom $ARG3$ --mailto $ARG3$ -U $ARG4$ -P $USER6$ -w 30 -c 60 --header "Subject: Nagios Test %TOKEN1%" --verbose" -p "$USER5$/check_imap_receive -H $ARG2$ -U $ARG4$ -P $USER6$ -w 30 -c 60 -s SUBJECT -s "Nagios Test %TOKEN1%" --verbose"',
  plugin_type => 'extra',
}
*/

monitoring::command { "check_tcp":
  command => "check_tcp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
}



monitoring::command { "check_telnet":
  command => "check_tcp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -p 23',
}



monitoring::command { "check_udp":
  command => "check_udp",
  command_args => '-t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
}


monitoring::command { "check_procs":
  command => "check_procs",
  command_args => '-w $ARG1$ -c $ARG2$ -C $ARG3$',
}


monitoring::command { "check_proc_args":
  command => "check_procs",
  command_args => '-w $ARG1$ -c $ARG2$ -C $ARG3$ -a "$ARG4$"',
}

/*
monitoring::command { "check_ssh_tunnel":
  command => "check_ssh_tunnel",
  command_args => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C $ARG3$ -a "$ARG4$"',
}
*/
/*
monitoring::command { "check_pptp_tunnel":
  command => "check_procs",
  command_args => '-w $ARG1$ -c $ARG2$ -C pppd -a "$ARG3$"',
}
*/

monitoring::command { "check_sip":
  command => "check_sip",
  command_args => '-u sip:$ARG1$@$ARG2$ -w $USER3$',
  #command_args => '-u sip:$ARG1$@$ARG2$ -f sip:$ARG1$@$ARG2$ -H $ARG2$ -w $USER3$',
  #command_args => '-H $HOSTADDRESS$ -u sip:$ARG1$ -w $USER3$',
}

/*
monitoring::command { "check_sip_sipsak":
  command => "check_sip_sipsak.pl",
  command_args => '--hostname "$HOSTADDRESS$"',
  plugin_type => 'extra',
}

monitoring::command { "check_asterisk_alive":
  command => "check_asterisk_alive",
  command_args => '-unagios -p$USER4$ -H$ARG1$',
  plugin_type => 'extra',
}

monitoring::command { "check_asterisk_sip_trunk":
  command => "check_asterisk_sip_trunk",
  command_args => '-u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -s $ARG1$ -l $ARG2$',
  plugin_type => 'extra',
}

monitoring::command { "check_asterisk_sip_extension":
  command => "check_asterisk_sip_extension",
  command_args => '-u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -e $ARG1$ -l $ARG2$',
  plugin_type => 'extra',
}

monitoring::command { "check_asterisk_iax_extension":
  command => "check_asterisk_iax_extension",
  command_args => '-u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -e $ARG1$ -l $ARG2$',
  plugin_type => 'extra',
}

monitoring::command { "check_openvpn":
  command => "check_openvpn.pl",
  command_args => '-H $ARG1$ -p $ARG2$ -n',
  plugin_type => 'extra',
}
*/

monitoring::command { "check_host_alive":
  command => "check_icmp",
  command_args => '-H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -n 5',
  sudo => true,
}


monitoring::command { "check_virtual_host":
  command => "check_icmp",
  command_args => '-H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -n 5',
  sudo => true,
}

/*
monitoring::command { "check_firewalled_host_alive":
  command => "check_firewalled_ping",
  command_args => '-H $HOSTADDRESS$ $ARG2$ -w 3000.0,80% -c 5000.0,100%',
  plugin_type => 'extra',
}
*/

#################
# notification commands
#################

monitoring::command { "host_notify_by_email":
  plugin_type => 'none',
  command => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\nHost $HOSTSTATE$ for $HOSTDURATION$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
  command_args => "",
}

monitoring::command { "notify_by_email":
  plugin_type => 'none',
  command => '/usr/bin/printf "%b" "***** Nagios 3.0 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
  command_args => "",
}
/*
nagios_command { "host_notify_by_email":
  command_name => "host_notify_by_email",
  command_line => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\nHost $HOSTSTATE$ for $HOSTDURATION$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
  notify => Class[$monitoring_service],
}

nagios_command { "notify_by_email":
  command_name => "notify_by_email",
  command_line => '/usr/bin/printf "%b" "***** Nagios 3.0 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
  notify => Class[$monitoring_service],
}
*/
#################
# mysql stuff
#################

monitoring::command { "check_mysqld":
  command => "check_mysqld.pl",
  command_args => '-u nagios -p $USER2$ -H $ARG1$ -P $ARG2$ -w $USER10$ -c $USER11$ -a $USER12$ -A $USER13$',
  plugin_type => 'extra',
}

monitoring::command { "check_mysql_server":
  command => "check_mysql",
  command_args => '-u nagios -p $USER2$ -H $ARG1$ -P $ARG2$',
}

monitoring::command { "check_mysql_connections":
  command => "check_mysql_connections",
  command_args => '-u nagios -p $USER2$ -w $ARG1$ -c $ARG2$ -H $ARG3$ -P $ARG4$',
  plugin_type => 'extra',
}

monitoring::command { "check_mysql_repl_lag":
  command => "check_mysql",
  command_args => '-H $ARG1$ -P $ARG2$ -u nagios -p $USER2$ -S -w $ARG3$ -c $ARG4$',
}

################
# SNMP commands
################
/*
# check disk via snmp
monitoring::command { "check_snmp_hdd":
  command => "check_snmp_disk",
  command_args => '$USER1$/check_snmp_disk -H $ARG1$ -C monitoring -w $ARG2$ -c $ARG3$ -m d',
}

# check ram via snmp
monitoring::command { "check_snmp_ram":
  command => "check_snmp_disk",
  command_args => '-d -H $ARG1$ -C monitoring -w $ARG2$ -c $ARG3$ -m r',
}

# check virtual memory via snmp
monitoring::command { "check_snmp_vram":
  command => "check_snmp_disk",
  command_args => '-d -H $HOSTADDRESS$ -C monitoring -w $ARG1$ -c $ARG2$ -m v',
}

# check apache processes via snmp
monitoring::command { "check_snmp_apache_proc":
  command => "check_snmp_process",
  command_args => '-d -H $ARG1$ -C monitoring -w $ARG2$ -c $ARG3$ -m apache2',
}

# check httpd processes via snmp
monitoring::command { "check_snmp_httpd_proc":
  command => "check_snmp_process",
  command_args => '-d -H $ARG1$ -C monitoring -w $ARG2$ -c $ARG3$ -m httpd',
}

# check sshd processes via snmp
monitoring::command { "check_snmp_sshd_proc":
  command => "check_snmp_process",
  command_args => '-d -H $HOSTADDRESS$ -C monitoring -w $ARG1$ -c $ARG2$ -m sshd',
}

# check load via snmp
monitoring::command { "check_snmp_load":
  command => "check_snmp_load",
  command_args => '-d -H $HOSTADDRESS$ -C monitoring -w $ARG1$ -c $ARG2$ -m L',
}
*/

# WINDOWS services
# NSClient version
monitoring::command { "check_nsclient":
  command => "check_nt",
  command_args => '-H $HOSTADDRESS$ -p 1428 -v CLIENTVERSION',
}

# check windows LOAD
monitoring::command { "check_win_load":
  command => "check_nt",
  command_args => '-H $HOSTADDRESS$ -p 1428 -v CPULOAD -l 1,40,60,5,50,90,15,80,100',
}

# windows memory usage
monitoring::command { "check_win_mem":
  command => "check_nt",
  command_args => '-H $HOSTADDRESS$ -p 1428 -v MEMUSE -w $ARG1$ -c $ARG2$',
}

# windows HDD usage
monitoring::command { "check_win_disk":
  command => "check_nt",
  command_args => '-H $HOSTADDRESS$ -p 1428 -v USEDDISKSPACE -l $ARG1$ -w $ARG2$ -c $ARG3$',
}

# windows service check
monitoring::command { "check_win_service":
  command => "check_nt",
  command_args => '-H $HOSTADDRESS$ -p 1428 -d SHOWALL -v SERVICESTATE -l "$ARG1$"',
}

# check freshness of passice checks
monitoring::command { "service_is_stale":
  command => "check_dummy",
  command_args => '1 "WARNING: no service data since $LASTSERVICECHECK$"',
}

monitoring::command { "check_mysql_zrm_status":
  command => "check_dummy",
  command_args => '1 "WARNING: ZRM for $ARG1$ not run since $LASTSERVICECHECK$"',
}
/*
### nsca stuff
monitoring::command { "submit_service_check":
  command => "submit_check_result",
  command_args => '$HOSTNAME$ "$SERVICEDESC$" $SERVICESTATE$ "$SERVICEOUTPUT$|$SERVICEPERFDATA$"',
  plugin_type => 'extra',
}

monitoring::command { "submit_host_check":
  command => "submit_host_result",
  command_args => '$HOSTNAME$ $HOSTSTATEID$ "$HOSTOUTPUT$"',
  plugin_type => 'extra',
}
*/

# EVENT HANDLERS
/*
monitoring::command { "handle_master_host_event":
  command => "handle_master_host_event",
  command_args => '$USER1$/eventhandlers/handle-master-host-event $HOSTSTATE$ $HOSTSTATETYPE$',
}

monitoring::command { "handle_master_proc_event":
  command => "handle_master_proc_event",
  command_args => 'eventhandlers/handle-master-proc-event $SERVICESTATE$ $SERVICESTATETYPE$',
}
*/
}
