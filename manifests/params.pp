# == Class pdagent::params
#
# This class is meant to be called from pdagent.
# It sets variables according to platform.
#
class pdagent::params {

  case $::osfamily {
    'Debian': {
      $package_name              = 'pdagent'
      $integrations_package_name = 'pdagent-integrations'
      $service_name              = 'pdagent'
    }
    'RedHat', 'Amazon': {
      $package_name              = 'pdagent'
      $integrations_package_name = 'pdagent-integrations'
      $service_name              = 'pdagent'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
