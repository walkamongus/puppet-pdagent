# == Class pdagent::service
#
# This class is meant to be called from pdagent.
# It ensure the service is running.
#
class pdagent::service {

  service { $::pdagent::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
