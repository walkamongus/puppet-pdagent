# == Class pdagent::install
#
# This class is called from pdagent for install.
#
class pdagent::install {

  package { $::pdagent::package_name:
    ensure => present,
  }

  if $::pdagent::params::install_integrations_package {
    package { $::pdagent::integrations_package_name:
      ensure => present,
    }
  }
}
