# == Class: pdagent
#
# Full description of class pdagent here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class pdagent (
  $package_name              = $::pdagent::params::package_name,
  $integrations_package_name = $::pdagent::params::integrations_package_name,
  $service_name              = $::pdagent::params::service_name,
) inherits ::pdagent::params {

  validate_string(
    $package_name,
    $integrations_package_name,
    $service_name
  )

  class { '::pdagent::repo': } ->
  class { '::pdagent::install': } ->
  class { '::pdagent::service': } ->
  Class['::pdagent']

}
