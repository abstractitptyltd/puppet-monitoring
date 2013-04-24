  
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
  
  monitoring::command { "check_http":
    command => "check_http",
    command_args => '-t $USER3$ -H $ARG1$ -u /$ARG2$',
  }
  
  monitoring::command { "check_http_port_string":
    command => "check_http",
    command_args => '-t $USER3$ -H $ARG1$ -u $ARG2$ -p $ARG3$ -s "$ARG4$"',
  }
  
  monitoring::command { "check_https":
    command => "check_http",
    command_args => '-t $USER3$ -H $ARG1$ -I $ARG2$ -u /$ARG3$ -S -w 60 -c 120',
  }
  
  monitoring::command { "check_https_port_string":
    command => "check_http",
    command_args => '-t $USER3$ -H $ARG1$ -I $ARG2$ -u $ARG2$ -S -w 60 -c 120 -p $ARG3$ -s "$ARG4$"',
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
  
  monitoring::script { 'check_traceroute':
    template => "monitoring/scripts/check_traceroute.erb",
  }
  
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
  
  monitoring::command { "check_sip":
    command => "check_sip",
    command_args => '-u sip:$ARG1$@$ARG2$ -w $USER3$',
    #command_args => '-u sip:$ARG1$@$ARG2$ -f sip:$ARG1$@$ARG2$ -H $ARG2$ -w $USER3$',
    #command_args => '-H $HOSTADDRESS$ -u sip:$ARG1$ -w $USER3$',
  }
  
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
    command => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
    command_args => "",
  }

  #################
  # mysql stuff
  #################
  
  monitoring::command { "check_mysqld":
    command => "check_mysqld.pl",
    command_args => '-u nagios -p $USER2$ -H $ARG1$ -P $ARG2$ -w $USER10$ -c $USER11$ -a $USER12$ -A $USER13$',
    plugin_type => 'extra',
  }
  monitoring::script { 'check_mysqld':
    template => "monitoring/scripts/check_mysqld.pl.erb",
  }
  monitoring::command { "check_mysql_connections":
    command => "check_mysql_connections",
    command_args => '-u nagios -p $USER2$ -w $ARG1$ -c $ARG2$ -H $ARG3$ -P $ARG4$',
    plugin_type => 'extra',
  }
  monitoring::script { 'check_mysql_connections':
    template => 'monitoring/scripts/check_mysql_connections.erb',
  }
  
  monitoring::command { "check_mysql_server":
    command => "check_mysql",
    command_args => '-u nagios -p $USER2$ -H $ARG1$ -P $ARG2$',
  }
  
  monitoring::command { "check_mysql_repl_lag":
    command => "check_mysql",
    command_args => '-H $ARG1$ -P $ARG2$ -u nagios -p $USER2$ -S -w $ARG3$ -c $ARG4$',
  }
  
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

}
