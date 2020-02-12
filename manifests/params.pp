# == Class pdagent::params
#
# This class is meant to be called from pdagent.
# It sets variables according to platform.
#
class pdagent::params {

  if $facts['osfamily'] !~ /^(Debian|RedHat|Amazon)$/ {
    fail("${::operatingsystem} not supported")
  }

  $manage_repo                     = true
  $package_name                    = 'pdagent'
  $integrations_package_name       = 'pdagent-integrations'
  $service_name                    = 'pdagent'
  $config_filename                 = '/etc/pdagent.conf'
  $send_interval_secs              = 10
  $cleanup_interval_secs           = 10800
  $cleanup_threshold_secs          = 604800
  $backoff_interval_secs           = 60
  $retry_limit_for_possible_errors = 60
  $source_address                  = '0.0.0.0'
}
