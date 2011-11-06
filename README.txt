check_puppetmaster
==================

Nagios checking script that generates a warning or error if one or more nodes
hasn't checked in with the master for a specified time.

This script is licensed under the terms of the GPL.
Please see http://www.gnu.org/copyleft/gpl.html for full details.

You can obtain the latest version of this script via the repository at
https://github.com/cafuego/check_puppetmaster


== INSTALLATION ==

Plonk check_puppetmaster in /usr/lib/nagios/plugins or symlink it there
from your preferred installation location. I use /usr/local/bin.

Install default as /etc/default/check_puppetmaster.


== CONFIGURATION ==

Configuration is pretty straightforward. You need to add a command on your
nagios server that can run the check_puppetmaster plugin on your puppetmaster
host. You will want to (for nagios2 at least) specify a command, a service and
a hostgroup. Here are mine:

  define command {
    command_name check_puppetmaster
    command_line /usr/local/sbin/check_remote_plugin $HOSTADDRESS$ check_puppetmaster
  }

  define service {
    hostgroup_name      puppetmasters
    service_description Puppet - Master Server
    check_command       check_puppetmaster
    use                 generic-service
  }

  define hostgroup {
    hostgroup_name puppetmasters
    alias          Puppet Master Servers
    members        kanies, beaker, turnbull
  }

Finally, you may want to override settings via /etc/default/check_puppetmaster
as your configuration may not match mine, which is what the defaults work with.

Importantly, add any FQDNs to the IGNORE_HOSTS variable for systems that are
managed via puppet but that may not be online 24/7, such as laptops. This will
avoid warnings or critical notifications if these systems haven't checked in
for a while.
