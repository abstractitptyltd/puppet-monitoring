abstractit-monitoring
====

####Table of Contents

0. [New stuff](#new)
1. [Breaking Changes](#changes)
2. [Bug fixes](#fixes)
3. [Requirements](#requirements)
4. [Overview - What is the monitoring module?](#overview)
5. [Module Description - What does the module do?](#module-description)
6. [Setup - The basics of getting started with monitoring](#setup)
7. [Usage - The parameters available for configuration](#usage)
8. [Implementation - An under-the-hood peek at what the module is doing](#implementation)
9. [Limitations - OS compatibility, etc.](#limitations)
10. [Development - Guide for contributing to the module](#development)
11. [Release Notes - Notes on the most recent updates to the module](#release-notes)

New stuff
---------

Initial move towards using base class as primary API.
Added metadata.json file for compatability with newer versions of puppet
Fixed template variables

I recently started a consulting company called Abstract IT Pty Ltd. I have transfered ownership of all my puppet modules to a new organisation on Puppet Forge called abstractit.
I am making one final release of my modules under rendhalver and abstractit to give you a chance to switch over to the new organisation.
I have also added a licence. All my modules will be licenced under Apache v2.

Breaking Changes
----------------

As of version 1.1.x
`$monitoring_service` is no longer a class variable `monitoring::params`
`$monitoring_type` is used to set the server type (icinga or nagios currently) which determines the user and service to notify
I have removed some really old files I need to convert so if you were using those let me know.
I don't think you would be because they don't work with the current setup.

Bug fixes
---------

fixing some package dependencies for Fedora 19

added a define for creating nagios hostgroups
added getting hostgroup set by and ENC or other method that sets $::hostgroup
`monitoring::params::host_groups` can now be an array or a , separated string
including sudo in base class as it's needed now
including more exported nagios resources

added a few new commands
`check_http_port_string` for checking the existence of a string on a web page
`check_https_port_string` for checking the existence of a string on a https web page
added a script so the `check_route` command has something to run
removed a few commands that didn't have scripts

Requirements
--------

Stored configs on your puppetmaster (I highly recommend using puppetdb with a postgresql backend for this).
Hiera is used for getting some variables so a puppet version that supports hiera is required.
I have only tested this with puppet 3.x but it should work with 2.7.
If anyone has gotten it working in other versions please let me know.

Overview
--------

Puppet module for managing monitoring and nagios resources
Node resources are exported to a monitoring server

Module Description
------------------

Puppet module for managing puppet monitoring resources.
The base module sets up a few basic servies to monitor.

Setup
-----

**what monitoring affects:**

* Not a lot on the node itself most resources are exported
* On a server node the resources to monitor are put in /etc/nagios/ and can be read by icinga or nagios from there

### Beginning with monitoring

This will manage a basic setup for monitoring a node.
This will also pull in all the exported resources for a node that is also a monitoring server

    include monitoring

Variables that need to be set for monitoring to work
These are class params so use hiera or and ENC to set them up easily.

Using monitoring class:

    $monitoring::monitoring_server
    # node that will monitor this node
    $monitoring::monitoring_type
    # Type of the monitoring server (icinga or nagios currently)

Using monitoring::params
    $monitoring::params::monitoring_server
    # node that will monitor this node
    $monitoring::params::monitoring_type
    # Type of the monitoring server (icinga or nagios currently)

Extra params for this node.
Using monitoring class

    $monitoring::host_name
    # for overriding the host_name of this node, defaults to $fqdn
    $monitoring::host_ip
    # for overriding the host_ip of this node, defaults to $ipaddress
    $monitoring::host_groups
    # comma separates list of host_groups to add this host to
    $monitoring::parents
    # parent for this host
    $monitoring::host_type
    # host template to use for this host default is linux_server
    $monitoring::host_alias
    # alias to set for this host
    $monitoring::check_period
    # when to check this host
    $monitoring::notification_period
    # when to send notifications for this host

using monitoring::params
    $monitoring::params::host_name
    # for overriding the host_name of this node, defaults to $fqdn
    $monitoring::params::host_ip
    # for overriding the host_ip of this node, defaults to $ipaddress
    $monitoring::params::host_groups
    # comma separates list of host_groups to add this host to
    $monitoring::params::parents
    # parent for this host
    $monitoring::params::host_type
    # host template to use for this host default is linux_server
    $monitoring::params::host_alias
    # alias to set for this host
    $monitoring::params::check_period
    # when to check this host
    $monitoring::params::notification_period
    # when to send notifications for this host


Extra params for setting up a notify script for sms alerts.
I only have a script for clickatell right now so the defaults set that up.
Using monitoring class

    $monitoring::sms_notify_script_name
    # name of the script
    # this will get used in contact templates 
    $monitoring::sms_notify_script_template
    # template to use for setting up the script
    $monitoring::sms_host_notify_command_args
    # args to use for the host notify command
    $monitoring::sms_notify_command_args
    # args to use for the service notify command

using monitoring::params class
    $monitoring::params::sms_notify_script_name
    # name of the script
    # this will get used in contact templates 
    $monitoring::params::sms_notify_script_template
    # template to use for setting up the script
    $monitoring::params::sms_host_notify_command_args
    # args to use for the host notify command
    $monitoring::params::sms_notify_command_args
    # args to use for the service notify command


Usage
-----

    monitoring::script { "script_name":
      ensure => present, 
      template => undef, 
      file => undef, 
      script_type => 'template',
    }

### monitoring::script

installs a script in the `$monitoring::params::nagios_extra_plugins` directory

**Parameters within monitoring::script**

#### `ensure`

Whether the script should exist or not default is taken from `$monitoring::params::ensure`

#### `template`

Location of the template

#### `file`

Full puppet location of the file 

#### `script_type`

Type of the script, template or file


    monitoring::command { "command_name":
      command => "command_to_run",
      command_args => '--args', 
      plugin_type => 'main',
      sudo => false, 
    }

### monitoring::command

Sets up a command on the monitoring server

**Parameters within monitoring::command**

#### `ensure`

Whether the script should exist or not default is taken from `$monitoring::params::ensure`

#### `command`

Command to run.

#### `command_args`

Args for the command.

#### `plugin_type`

Type of plugin.

#### `sudo`

Whether to enable sudo for the command
This sets up an sudo rule on the node for the user the monitoring server runs as (automagically determined)


    monitoring::service { "service_name":
      servicegroups => "blah,blah", 
      check_command => 'command!arg1!arg2',
      service_description => 'what it does',
    }

### monitoring::command

Sets up a command on the monitoring server

**Parameters within monitoring::command**

#### `ensure`

Whether the script should exist or not default is taken from `$monitoring::params::ensure`

#### `servicegroups`

servicegroups this command belongs to

#### `check_command`

command to run for the service check

#### `service_description`

description for the service

#### `service_type`

service template to use, default is `standard_service`

#### `notifications`

defaults to `$monitoring::params::notifications`

#### `sms_alerts`

defaults to `$monitoring::params::sms_alerts`

#### `contact_groups`

defaults to admins

#### `sms_contact_groups`

sms contats to append to `contact_groups` if `sms_alerts` is true

#### `register`

whether to register the service with the monitoring server

#### `host_name`

hostname for the serice to check, defaults to `$monitoring::params::host_name`

#### `monitoring_server`

monitoring server for the serice to check, defaults to `$monitoring::params::monitoring_server`

#### `max_check_attempts`

for overriding the default set in the service template

#### `notification_options`

for overriding the default set in the service template

#### `normal_check_interval`

for overriding the default set in the service template

#### `retry_check_interval`

for overriding the default set in the service template

#### `notification_interval`

for overriding the default set in the service template


    monitoring::net_device { "router.example.com":
      host_ip => "10.10.10.0", 
    }

### monitoring::net_device

Sets up a router to monitor

**Parameters within monitoring::net_device**

#### `ensure`

Whether the router should be defined. Defaults to true

#### `host_ip`

ip adress of the router

#### `host_parents`

parent of this router

#### `host_groups`

host groups for the router, defaults to network_hardware

#### `host_alias`

alias for the router, defaults to undef

#### `timeperiod`

for overriding the defualt 24x7 timeperiod

#### `ping_warn`

ping timout warning value for this router

#### `ping_crit`

ping timeout critical value for this router

#### `notifications`

whether to enable notifications, defaults to true

#### `monitoring_server`

server that monitors this router, defaults to `$monitoring::params::monitoring_server`


Implementation
--------------

Uses exported resources to specify which services get monitored on this node

Limitations
------------

Fedora 18 has some issue with importing the services.
I think it is an issue with puppet or ruby itself but not completely sure at this stage.
While I would it out you will have to delete the nagios_* files on your monitoring server before importing new resources. 
There may be others. Don't hesitate to let me know if you find any.

Development
-----------

All development, testing and releasing is done by me at this stage.
If you wish to join in let me know.

Release Notes
-------------

**1.3.3**

BUGFIXES: don't setup hostgroup for a node if it is undefined

**1.3.2**

BUGFIXES: get monitoring_server and monitoring_type in defines from base class

**1.3.1**

BUGFIXES: set monitoring_server and monitoring_type to under in params class

**1.3.0**

BUGFIXES: Template fixes (@rfray)
Initial move towards using base class as primary API.

**1.2.1**

fix packages on ubuntu
Depends on new version of abstractit/sudo

**1.2.0**

fixing dependencies

**1.1.9**

Final release for rendhalver-nrpe.
First release as abstractit-nrpe.
Code cleanups

**1.1.8**
More Fedora 19 package fixes

**1.1.7**
Fedora 19 package fixes

**1.1.6**

fixing stupid error
mysql scripts need to be in mysql service class

**1.1.5**

added monitoring::hostgroup define for creating host groups on the monitoring server
including more exported nagios resources

**1.1.4**

fixing install packages

**1.1.3**

adding mysql check options and commands

**1.1.2**

added some missing scripts
using validate_re to check monitoring_type

**1.1.1**

Removed some old files that still need converting to the new format.
Silly me has been including them in the forge builds the whole time without realising.
Added detailed check scripts for smtp, imap and pop scripts.
Added route service

**1.1.0**

added new type for adding nagios commands
this uses my sudo module for adding sudo rules if required

new type for adding extra scripts

new settings for adding sms notification script

new documentation describing how it all works

**1.0.7**

update to use new format for nrep::plugin

**1.0.6**

need to install Unix::Lsof via cpan if it isn't installed

**1.0.5**

adding docs and example node adding a few missing packages

**1.0.4**

a few fixes and requiring new version of nrpe

**1.0.3**

fixing reboot service clas

**1.0.2**

switched back to old way of doing class chaining

**1.0.1**

adding check_period to params and monitoring::host. Removing references to some old var names. Indentation cleanup

**1.0.0**

Initial release
