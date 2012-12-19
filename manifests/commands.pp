
class monitoring::commands {
  include monitoring::params
  $monitoring_service = $monitoring::params::monitoring_service

nagios_command { "check_local_disk":
  command_name  => "check_local_disk",
  command_line  => '$USER1$/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$',
  notify      => Class[$monitoring_service],
}

nagios_command { "check_smb_disk":
  command_name    => "check_smb_disk",
  command_line    => '$USER1$/check_disk_smb -w $ARG1$ -c $ARG2$ -H $ARG3$ -s $ARG4$ -u $ARG5$ -p $ARG6$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_nrpe_status":
  command_name    => "check_nrpe_status",
  command_line    => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_nrpe":
  command_name    => "check_nrpe",
  command_line    => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$ -c $ARG1$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_nrpe_other":
  command_name    => "check_nrpe_other",
  command_line    => '$USER1$/check_nrpe -t $USER3$ -H $ARG1$ -c $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_nfs":
  command_name    => "check_nfs",
  command_line    => '$USER1$/check_rpc -t $USER3$ -H $ARG1$ -C nfs',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_local_load":
  command_name    => "check_local_load",
  command_line    => '$USER1$/check_load -w $ARG1$ -c $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_local_swap":
  command_name    => "check_local_swap",
  command_line    => '$USER1$/check_swap -w 50% -c 20%',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_local_memory":
  command_name    => "check_local_memory",
  command_line    => '$USER5$/check_memory.pl -w 10% -c 5%',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_total_local_procs":
  command_name    => "check_total_local_procs",
  command_line    => '$USER1$/check_procs -w $ARG1$ -c $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_local_procs":
  command_name    => "check_local_procs",
  command_line    => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C $ARG3$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_local_users":
  command_name    => "check_local_users",
  command_line    => '$USER1$/check_users -w $ARG1$ -c $ARG2$',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_ups":
  command_name    => "check_ups",
  command_line    => '$USER1$/check_apc bcharge 50 10',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_dns":
  command_name    => "check_dns",
  command_line    => '$USER1$/check_dns -t $USER3$ -s $HOSTADDRESS$ -H $ARG1$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_dns_ip":
  command_name    => "check_dns_ip",
  command_line    => '$USER1$/check_dns -t $USER3$ -s $HOSTADDRESS$ -H $ARG1$ -a $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_dnszone":
  command_name    => "check_dnszone",
  command_line    => '$USER1$/check_dns -t $USER3$ -H $ARG1$ -a $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_ext_dnszone":
  command_name    => "check_ext_dnszone",
  command_line    => '$USER1$/check_dns -t $USER3$ -s $ARG1$ -H $ARG2$  -a $ARG3$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_dns_server":
  command_name    => "check_dns_server",
  command_line    => '$USER1$/check_dns -t $USER3$ -s $ARG1$ -H $ARG2$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_ssh":
  command_name    => "check_ssh",
  command_line    => '$USER1$/check_ssh -t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_rdp":
  command_name  => "check_rdp",
  command_line  => '$USER1$/check_tcp -t $USER3$ -H $HOSTADDRESS$ -p 3389',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_ftp":
  command_name    => "check_ftp",
  command_line    => '$USER1$/check_ftp -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_hpjd":
  command_name    => "check_hpjd",
  command_line    => '$USER1$/check_hpjd -H $HOSTADDRESS$ $ARG1$',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_snmp":
  command_name    => "check_snmp",
  command_line    => '$USER1$/check_snmp -H $HOSTADDRESS$ $ARG1$',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_cisco":
  command_name    => "check_cisco",
  command_line    => '$USER5$/check_cisco.pl -h $HOSTADDRESS$ -c $ARG1$ -i $ARG2$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_snmp_netint":
  command_name    => "check_snmp_netint",
  command_line    => '$USER5$/check_snmp_netint.pl -H $HOSTADDRESS$ $ARG1$',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_http":
  command_name    => "check_http",
  command_line    => '$USER1$/check_http -t $USER3$ -H $ARG1$ -u /$ARG2$',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_https":
  command_name    => "check_https",
  command_line    => '$USER1$/check_http -t $USER3$ -H $ARG1$ -I $ARG2$ -u /$ARG3$ -S -w 60 -c 120',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_http_ssl_cert":
  command_name    => "check_http_ssl_cert",
  command_line    => '$USER1$/check_http -t $USER3$ -H $ARG1$ -I $ARG2$ -u /$ARG3$ -S -C 7',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_http_cert":
  command_name    => "check_http_cert",
  command_line    => '$USER1$/check_http -t $USER3$ -H $ARG1$ -u /$ARG2$ -S',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_nntp":
  command_name    => "check_nntp",
  command_line    => '$USER1$/check_nntp -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_ping":
  command_name    => "check_ping",
  command_line    => '$USER1$/check_ping -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 5',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_icmp":
  command_name    => "check_icmp",
  command_line    => '/usr/bin/sudo $USER1$/check_icmp -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -n 5',
#  command_line    => '$USER1$/check_ping -H $HOSTADDRESS$ -w $ARG1$ -c $ARG2$ -p 5',
  notify      => Class[$monitoring_service],
}

nagios_command { "check_route":
  command_name    => "check_route",
  command_line    => '$USER5$/check_traceroute $ARG1$',
  notify      => Class[$monitoring_service],
}



nagios_command { "check_xen":
  command_name    => "check_xen",
  command_line    => '$USER1$/check_xen -H $HOSTNAME$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_dbserver":
  command_name    => "check_dbserver",
  command_line    => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$ -c check_dbserver',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_mmsserver":
  command_name    => "check_mmsserver",
  command_line    => '$USER1$/check_nrpe -t $USER3$ -H $HOSTADDRESS$ -c check_mmsserver',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_mailq":
  command_name    => "check_mailq",
  command_line    => '$USER1$/check_mailq -M $ARG1$ -w $ARG2$ -c $ARG3$',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_jabber":
  command_name    => "check_jabber",
  command_line    => '$USER1$/check_jabber -t $USER3$ -H $HOSTADDRESS$ -e "$ARG1$"',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_pop":
  command_name    => "check_pop",
  command_line    => '$USER1$/check_pop -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "check_pop_detailed":
  ## arg1 host arg2 port
  command_name => "check_pop_detailed",
  command_line => '$USER1$/check_pop -t $USER3$ -H $ARG1$ -p $ARG2$',
  notify => Class[$monitoring_service],
}


nagios_command { "check_imap":
  command_name    => "check_imap",
  command_line    => '$USER1$/check_imap -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
}

nagios_command { "check_imap_detailed":
  ## arg1 host arg2 port
  command_name => "check_imap_detailed",
  command_line => '$USER1$/check_imap -t $USER3$ -H $ARG1$ -p $ARG2$',
  notify => Class[$monitoring_service],
}


nagios_command { "check_smtp_detailed":
  ## arg1 host arg2 port
  command_name => "check_smtp_detailed",
  command_line => '$USER1$/check_smtp -t $USER3$ -H $ARG1$ -p $ARG2$',
  notify => Class[$monitoring_service],
}

nagios_command { "check_smtp":
  command_name => "check_smtp",
  command_line => '$USER1$/check_smtp -t $USER3$ -H $HOSTADDRESS$',
  notify => Class[$monitoring_service],
}

nagios_command { "check_smtps":
  command_name    => "check_smtps",
  command_line    => '$USER1$/check_smtps -p 465 -t $USER3$ -H $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
}


nagios_command { "check_smtp_auth":
  command_name    => "check_smtp_auth",
  command_line    => '$USER1$/check_smtp -A LOGIN -S -D 5 -t $USER3$ -H $HOSTADDRESS$ -U $ARG1$ -P "$ARG2$"',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_email_delivery":
  command_name  => "check_email_delivery",
  command_line  => '$USER5$/check_email_delivery -w 60 -c 120 --verbose -p "$USER5$/check_smtp_send -H $ARG1$ --mailfrom $ARG3$ --mailto $ARG3$ -U $ARG4$ -P hygYHGVfrtf57uhh -w 30 -c 60 --header "Subject: Nagios Test %TOKEN1%" --verbose" -p "$USER5$/check_imap_receive -H $ARG2$ -U $ARG4$ -P hygYHGVfrtf57uhh -w 30 -c 60 -s SUBJECT -s "Nagios Test %TOKEN1%" --verbose"',
  notify      => Class[$monitoring_service],
}


nagios_command { "check_tcp":
  command_name  => "check_tcp",
  command_line  => '$USER1$/check_tcp -t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
  notify      => Class[$monitoring_service],
  }



nagios_command { "check_telnet":
  command_name    => "check_telnet",
  command_line    => '$USER1$/check_tcp -t $USER3$ -H $HOSTADDRESS$ -p 23',
  notify      => Class[$monitoring_service],
        }



nagios_command { "check_udp":
  command_name  => "check_udp",
  command_line  => '$USER1$/check_udp -t $USER3$ -H $HOSTADDRESS$ -p $ARG1$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_procs":
  command_name  => "check_procs",
  command_line  => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C $ARG3$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_proc_args":
  command_name  => "check_proc_args",
  command_line  => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C $ARG3$ -a "$ARG4$"',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_ssh_tunnel":
  command_name  => "check_ssh_tunnel",
  command_line  => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C $ARG3$ -a "$ARG4$"',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_pptp_tunnel":
  command_name  => "check_pptp_tunnel",
  command_line  => '$USER1$/check_procs -w $ARG1$ -c $ARG2$ -C pppd -a "$ARG3$"',
  notify      => Class[$monitoring_service],
  }




nagios_command { "check_sip":
  command_name  => "check_sip",
  command_line  => '$USER1$/check_sip -u sip:$ARG1$@$ARG2$ -w $USER3$',
  #command_line  $USER5$/check_sip -u sip:$ARG1$@$ARG2$ -f sip:$ARG1$@$ARG2$ -H $ARG2$ -w $USER3$
  #command_line  $USER5$/check_sip -H $HOSTADDRESS$ -u sip:$ARG1$ -w $USER3$
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_sip_sipsak":
  command_name  => "check_sip_sipsak",
  #command_line  $USER5$/check_sip_sipsak.pl -H $HOSTADDRESS$
  command_line  => '$USER5$/check_sip_sipsak.pl --hostname "$HOSTADDRESS$"',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_asterisk_alive":
  command_name  => "check_asterisk_alive",
  command_line  => '$USER5$/check_asterisk_alive -unagios -p$USER4$ -H$ARG1$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_asterisk_sip_trunk":
  command_name  => "check_asterisk_sip_trunk",
  command_line  => '$USER5$/check_asterisk_sip_trunk -u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -s $ARG1$ -l $ARG2$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_asterisk_sip_extension":
  command_name  => "check_asterisk_sip_extension",
  command_line  => '$USER5$/check_asterisk_sip_extension -u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -e $ARG1$ -l $ARG2$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "check_asterisk_iax_extension":
  command_name  => "check_asterisk_iax_extension",
  command_line  => '$USER5$/check_asterisk_iax_extension -u nagios -p $USER4$ -H $HOSTADDRESS$ -w $USER3$ -e $ARG1$ -l $ARG2$',
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_openvpn":
  command_name  => "check_openvpn",
  command_line  => '$USER5$/check_openvpn.pl -H $ARG1$ -p $ARG2$ -n',
  notify      => Class[$monitoring_service],
}

nagios_command { "check_host_alive":
  command_name    => "check_host_alive",
  command_line    => '/usr/bin/sudo $USER1$/check_icmp -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -n 5',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_virtual_host":
  command_name    => "check_virtual_host",
  command_line    => '/usr/bin/sudo $USER1$/check_icmp -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -n 5',
#  command_line    => '$USER5$/check_virt $HOSTNAME$',
  notify      => Class[$monitoring_service],
        }


nagios_command { "check_firewalled_host_alive":
  command_name    => "check_firewalled_host_alive",
  command_line    => '$USER1$/check_firewalled_ping -H $HOSTADDRESS$ $ARG2$ -w 3000.0,80% -c 5000.0,100%',
  notify      => Class[$monitoring_service],
        }


#################
# notification commands
#################

nagios_command { "host_notify_by_email":
  command_name  => "host_notify_by_email",
  command_line  => '/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\nHost $HOSTSTATE$ for $HOSTDURATION$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
  notify      => Class[$monitoring_service],
  }

#nagios_command { "host_notify_by_epager":
#  command_name  => "host_notify_by_epager",
#  command_line  => '/usr/bin/printf "%b" "Host '$HOSTALIAS$' is $HOSTSTATE$\nInfo: $HOSTOUTPUT$\nTime: $LONGDATETIME$" | /bin/mail -s "$NOTIFICATIONTYPE$ alert - Host $HOSTNAME$ is $HOSTSTATE$" $CONTACTPAGER$',
#  notify      => Class[$monitoring_service],
#  }

nagios_command { "host_notify_by_pager":
  command_name  => "host_notify_by_pager",
  command_line  => '$USER5$/notify_by_clickatell.pl -a $USER7$ -u $USER8$ -p $USER9$ -n "$NOTIFICATIONTYPE$" -w "$NOTIFICATIONAUTHOR$" -c "$NOTIFICATIONCOMMENT$" -m "$NOTIFICATIONTYPE$: $HOSTNAME$ is $HOSTSTATE$ ($HOSTOUTPUT$) for $HOSTDURATION$" -t $CONTACTPAGER$',
  notify      => Class[$monitoring_service],
  }


nagios_command { "notify_by_email":
  command_name  => "notify_by_email",
  command_line  => '/usr/bin/printf "%b" "***** Nagios 3.0 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
  notify      => Class[$monitoring_service],
  }


#nagios_command { "notify_by_epager":
#  command_name  => "notify_by_epager",
#  command_line  => '/usr/bin/printf "%b" "Service: $SERVICEDESC$\nHost: $HOSTNAME$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\nInfo: $SERVICEOUTPUT$\nDate: $LONGDATETIME$" | /bin/mail -s "$NOTIFICATIONTYPE$: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$" $CONTACTPAGER$',
#  notify      => Class[$monitoring_service],
#  }

nagios_command { "notify_by_pager":
  command_name  => "notify_by_pager",
  command_line  => '$USER5$/notify_by_clickatell.pl -a $USER7$ -u $USER8$ -p $USER9$ -n "$NOTIFICATIONTYPE$" -w "$NOTIFICATIONAUTHOR$" -c "$NOTIFICATIONCOMMENT$" -m "$NOTIFICATIONTYPE$: $HOSTNAME$/$SERVICEDESC$ is $SERVICESTATE$ ($SERVICEOUTPUT$) for $SERVICEDURATION$" -t $CONTACTPAGER$',
  notify      => Class[$monitoring_service],
  }




######################
# 2chargeplus status
######################

nagios_command { "check_soap_api_tx_status":
  command_name  => "check_soap_api_tx_status",
  command_line  => '$USER1$/nagios_soap_tx.php $ARG1$ $ARG2$ $ARG3$ $ARG4$',
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_soap_api_loadsite_status":
  command_name  => "check_soap_api_loadsite_status",
  command_line  => '$USER1$/nagios_soap_loadsite.php $ARG1$ $ARG2$',
  notify      => Class[$monitoring_service],
  }

#################
# mysql stuff
#################

nagios_command { "check_mysqld":
  command_name  => "check_mysqld",
  command_line  => '$USER5$/check_mysqld.pl -u nagios -p $USER2$ -H $ARG1$ -P $ARG2$ -w $USER10$ -c $USER11$ -a $USER12$ -A $USER13$',
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_mysql_server":
  command_name  => "check_mysql_server",
  command_line  => '$USER1$/check_mysql -u nagios -p $USER2$ -H $ARG1$ -P $ARG2$',
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_mysql_connections":
  command_name  => "check_mysql_connections",
  command_line  => '$USER5$/check_mysql_connections -u nagios -p $USER2$ -w $ARG1$ -c $ARG2$ -H $ARG3$ -P $ARG4$',
  #command_line  $USER5$/check_mysql_connections -u root -p $ARG5$ -w $ARG1$ -c $ARG2$ -H $ARG3$ -P $ARG4$
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_mysql_repl_lag":
  command_name    => "check_mysql_repl_lag",
#       command_line    $USER1$/check_mysql -H 127.0.0.1 -P $ARG1$ -u root -p $ARG2$ -S -w $ARG3$ -c $ARG4$
  command_line    => '$USER1$/check_mysql -H $ARG1$ -P $ARG2$ -u nagios -p $USER2$ -S -w $ARG3$ -c $ARG4$',
  notify      => Class[$monitoring_service],
        }

################
# SNMP commands
################

# check disk via snmp
nagios_command { "check_snmp_hdd":
  command_name  => "check_snmp_hdd",
  command_line  => '$USER1$/check_snmp_disk -H $ARG1$ -C ipay-gbz -w $ARG2$ -c $ARG3$ -m d',
  notify      => Class[$monitoring_service],
  }

# check ram via snmp
nagios_command { "check_snmp_ram":
  command_name  => "check_snmp_ram",
  command_line  => '$USER1$/check_snmp_disk -d -H $ARG1$ -C ipay-gbz -w $ARG2$ -c $ARG3$ -m r',
  notify      => Class[$monitoring_service],
  }

# check virtual memory via snmp
nagios_command { "check_snmp_vram":
  command_name  => "check_snmp_vram",
  command_line  => '$USER1$/check_snmp_disk -d -H $HOSTADDRESS$ -C ipay-gbz -w $ARG1$ -c $ARG2$ -m v',
  notify      => Class[$monitoring_service],
  }

# check apache processes via snmp
nagios_command { "check_snmp_apache_proc":
  command_name  => "check_snmp_apache_proc",
  command_line  => '$USER1$/check_snmp_process -d -H $ARG1$ -C ipay-gbz -w $ARG2$ -c $ARG3$ -m apache2',
  notify      => Class[$monitoring_service],
  }

# check httpd processes via snmp
nagios_command { "check_snmp_httpd_proc":
  command_name  => "check_snmp_httpd_proc",
  command_line  => '$USER1$/check_snmp_process -d -H $ARG1$ -C ipay-gbz -w $ARG2$ -c $ARG3$ -m httpd',
  notify      => Class[$monitoring_service],
  }

# check sshd processes via snmp
nagios_command { "check_snmp_sshd_proc":
  command_name  => "check_snmp_sshd_proc",
  command_line  => '$USER1$/check_snmp_process -d -H $HOSTADDRESS$ -C ipay-gbz -w $ARG1$ -c $ARG2$ -m sshd',
  notify      => Class[$monitoring_service],
  }

# check load via snmp
nagios_command { "check_snmp_load":
  command_name    => "check_snmp_load",
  command_line    => '$USER1$/check_snmp_load -d -H $HOSTADDRESS$ -C ipay-gbz -w $ARG1$ -c $ARG2$ -m L',
  notify      => Class[$monitoring_service],
        }

# WINDOWS services
# NSClient version
nagios_command { "check_nsclient":
  command_name  => "check_nsclient",
  command_line  => '$USER1$/check_nt -H $HOSTADDRESS$ -p 1428 -v CLIENTVERSION',
  notify      => Class[$monitoring_service],
  }

# check windows LOAD
nagios_command { "check_win_load":
  command_name  => "check_win_load",
  command_line  => '$USER1$/check_nt -H $HOSTADDRESS$ -p 1428 -v CPULOAD -l 1,40,60,5,50,90,15,80,100',
  notify      => Class[$monitoring_service],
  }

# windows memory usage
nagios_command { "check_win_mem":
  command_name  => "check_win_mem",
  command_line  => '$USER1$/check_nt -H $HOSTADDRESS$ -p 1428 -v MEMUSE -w $ARG1$ -c $ARG2$',
  notify      => Class[$monitoring_service],
  }

# windows HDD usage
nagios_command { "check_win_disk":
  command_name  => "check_win_disk",
  command_line  => '$USER1$/check_nt -H $HOSTADDRESS$ -p 1428 -v USEDDISKSPACE -l $ARG1$ -w $ARG2$ -c $ARG3$',
  notify      => Class[$monitoring_service],
  }

# windows service check
nagios_command { "check_win_service":
  command_name  => "check_win_service",
  command_line  => '$USER1$/check_nt -H $HOSTADDRESS$ -p 1428 -d SHOWALL -v SERVICESTATE -l "$ARG1$"',
  notify      => Class[$monitoring_service],
  }

# check freshness of passice checks
nagios_command { "service_is_stale":
  command_name  => "service_is_stale",
  command_line  => '$USER1$/check_dummy 1 "WARNING: no service data since $LASTSERVICECHECK$"',
  notify      => Class[$monitoring_service],
  }

nagios_command { "check_mysql_zrm_status":
  command_name  => "check_mysql_zrm_status",
  command_line  => '$USER1$/check_dummy 1 "WARNING: ZRM for $ARG1$ not run since $LASTSERVICECHECK$"',
  notify      => Class[$monitoring_service],
  }

### nsca stuff
nagios_command { "submit_service_check":
  command_name  => "submit_service_check",
  command_line  => '$USER5$/submit_check_result $HOSTNAME$ "$SERVICEDESC$" $SERVICESTATE$ "$SERVICEOUTPUT$|$SERVICEPERFDATA$"',
  notify      => Class[$monitoring_service],
  }

nagios_command { "submit_host_check":
  command_name  => "submit_host_check",
  command_line  => '$USER5$/submit_host_result $HOSTNAME$ $HOSTSTATEID$ "$HOSTOUTPUT$"',
  notify      => Class[$monitoring_service],
  }

# EVENT HANDLERS

nagios_command { "handle_master_host_event":
  command_name    => "handle_master_host_event",
  command_line    => '$USER1$/eventhandlers/handle-master-host-event $HOSTSTATE$ $HOSTSTATETYPE$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "handle_master_proc_event":
  command_name    => "handle_master_proc_event",
  command_line    => '$USER1$/eventhandlers/handle-master-proc-event $SERVICESTATE$ $SERVICESTATETYPE$',
  notify      => Class[$monitoring_service],
        }

nagios_command { "restart_nas_nfs_server":
  command_name  => "restart_nas_nfs_server",
  command_line  => '$USER5$/eventhandlers/restart_nfs_servers.sh $SERVICESTATE$ $SERVICESTATETYPE$ $SERVICEATTEMPT$ "10.8.0.11"',
  notify      => Class[$monitoring_service],
  }

nagios_command { "reload_asterisk":
  command_name  => "reload_asterisk",
  command_line  => '$USER5$/eventhandlers/reload_asterisk $SERVICESTATE$ $SERVICESTATETYPE$ $SERVICEATTEMPT$ $HOSTADDRESS$',
  notify      => Class[$monitoring_service],
  }

}
