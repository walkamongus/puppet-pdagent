# == Class pdagent::install
#
# This class is called from pdagent for install.
#
class pdagent::install {

  package { $::pdagent::package_name:
    ensure => present,
  }

  package { $::pdagent::integrations_package_name:
    ensure => present,
  }

}
