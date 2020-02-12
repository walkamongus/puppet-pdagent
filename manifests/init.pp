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
  String $package_name                     = $::pdagent::params::package_name,
  String $integrations_package_name        = $::pdagent::params::integrations_package_name,
  String $service_name                     = $::pdagent::params::service_name,
  Boolean $manage_repo                     = $::pdagent::params::manage_repo,
  String $config_filename                  = $::pdagent::params::config_filename,
  Integer $send_interval_secs              = $::pdagent::params::send_interval_secs,
  Integer $cleanup_interval_secs           = $::pdagent::params::cleanup_interval_secs,
  Integer $cleanup_threshold_secs          = $::pdagent::params::cleanup_threshold_secs,
  Integer $backoff_interval_secs           = $::pdagent::params::backoff_interval_secs,
  Integer $retry_limit_for_possible_errors = $::pdagent::params::retry_limit_for_possible_errors,
  String $source_address                   = $::pdagent::params::source_address,
) inherits ::pdagent::params {

  validate_string(
    $package_name,
    $integrations_package_name,
    $service_name
  )

  validate_bool($manage_repo)

  if $manage_repo {
    class { '::pdagent::repo': }
  }
  -> class { '::pdagent::install': }
  -> class { '::pdagent::config': }
  -> class { '::pdagent::service': }
  -> Class['::pdagent']
}
