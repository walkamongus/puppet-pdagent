# == Class pdagent::config
#
# This class is used to configure PagerDuty agent
#
class pdagent::config {
  $send_interval_secs              = $::pdagent::send_interval_secs,
  $cleanup_interval_secs           = $::pdagent::cleanup_interval_secs,
  $cleanup_threshold_secs          = $::pdagent::cleanup_threshold_secs,
  $backoff_interval_secs           = $::pdagent::backoff_interval_secs,
  $retry_limit_for_possible_errors = $::pdagent::retry_limit_for_possible_errors,
  $source_address                  = $::pdagent::source_address,

  # This template uses:
  #   - send_interval_secs
  #   - cleanup_interval_secs
  #   - cleanup_threshold_secs
  #   - backoff_interval_secs
  #   - retry_limit_for_possible_errors
  #   - source_address
  file { $::pdagent::config_filename:
    ensure  => file,
    content => template('pdagent.conf.erb'),
  }
}
