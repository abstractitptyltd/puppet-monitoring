##2015-03-30 - Pete Brown <pete@abstractit.com.au> 1.3.6
###Summary
Bugfix release

####Bugfixes
Add path to exec to install LWP::Protocol::https

##2015-03-27 - Pete Brown <pete@abstractit.com.au> 1.3.5
###Summary
Bugfix release

####Bugfixes
Fixing location of perl binary for exec to install LWP::Protocol::https

##2015-02-20 - Pete Brown <pete@abstractit.com.au> 1.3.4
###Summary
Initial support for osfamily == Redhat 7
Code cleanup
Metadata fixes
Moved release notes to Changelog file

####Bugfixes
Fixing package names on RedHat 7

####2014-12-04 - Pete Brown <pete@abstractit.com.au> 1.3.3
 * BUGFIXES: don't setup hostgroup for a node if it is undefined

####2014-12-01 - Pete Brown <pete@abstractit.com.au> 1.3.2
 * BUGFIXES: get monitoring_server and monitoring_type in defines from base class

####2014-12-01 - Pete Brown <pete@abstractit.com.au> 1.3.1
 * BUGFIXES: set monitoring_server and monitoring_type to under in params class

####2014-12-01 - Pete Brown <pete@abstractit.com.au> 1.3.0
 * BUGFIXES: Template fixes (@rfray)
 * Initial move towards using base class as primary API.

####2014-04-08 - Pete Brown <pete@abstractit.com.au> 1.2.2
 * fix project url

####2014-02-10 - Pete Brown <pete@abstractit.com.au> 1.2.1
 * fix packages on ubuntu
 * Depends on new version of abstractit/sudo

####2014-02-06 - Pete Brown <pete@abstractit.com.au> 1.2.0
 * fixing dependencies

####2014-02-06 - Pete Brown <pete@abstractit.com.au> 1.1.9
 * Final release for rendhalver-nrpe.
 * First release as abstractit-nrpe.
 * Code cleanups

####2013-08-20 - Pete Brown <pete@abstractit.com.au> 1.1.8
 * More Fedora 19 package fixes

####2013-08-20 - Pete Brown <pete@abstractit.com.au> 1.1.7
 * Fedora 19 package fixes

####2013-07-23 - Pete Brown <pete@abstractit.com.au> 1.1.6
 * fixing stupid error
 * mysql scripts need to be in mysql service class

####2013-07-23 - Pete Brown <pete@abstractit.com.au> 1.1.5
 * added monitoring::hostgroup define for creating host groups on the monitoring server
 * including more exported nagios resources

####2013-04-03 - Pete Brown <pete@abstractit.com.au> 1.1.4
 * fixing install packages

####2013-04-03 - Pete Brown <pete@abstractit.com.au> 1.1.3
 * adding mysql check options and commands

####2013-04-02 - Pete Brown <pete@abstractit.com.au> 1.1.2
 * added some missing scripts
 * using validate_re to check monitoring_type

####2013-03-19 - Pete Brown <pete@abstractit.com.au> 1.1.1
 * Removed some old files that still need converting to the new format.
 * Silly me has been including them in the forge builds the whole time without realising.
 * Added detailed check scripts for smtp, imap and pop scripts.
 * Added route service

####2013-03-19 - Pete Brown <pete@abstractit.com.au> 1.1.0
 * added new type for adding nagios commands
   this uses my sudo module for adding sudo rules if required
 * new type for adding extra scripts
 * new settings for adding sms notification script
 * new documentation describing how it all works

####2013-03-14 - Pete Brown <pete@abstractit.com.au> 1.0.7
 * update to use new format for nrep::plugin

####2013-03-11 - Pete Brown <pete@abstractit.com.au> 1.0.6
 * need to install Unix::Lsof via cpan if it isn't installed

####2013-03-11 - Pete Brown <pete@abstractit.com.au> 1.0.5
 * adding docs and example node adding a few missing packages

####2013-02-20 - Pete Brown <pete@abstractit.com.au> 1.0.4
 * a few fixes and requiring new version of nrpe

####2013-01-16 - Pete Brown <pete@abstractit.com.au> 1.0.3
 * fixing reboot service clas

####2013-01-16 - Pete Brown <pete@abstractit.com.au> 1.0.2
 * switched back to old way of doing class chaining

####2013-01-18 - Pete Brown <pete@abstractit.com.au> 1.0.1
 * adding check_period to params and monitoring::host.
 * Removing references to some old var names.
 * Indentation cleanup

####2013-01-16 - Pete Brown <pete@abstractit.com.au> 1.0.0
 * First Public Release
