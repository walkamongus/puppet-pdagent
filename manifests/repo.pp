# == Class pdagent::repo
#
# This class is called from pdagent for repo.
#
class pdagent::repo {

  case $::osfamily {
    'Debian': {
      include ::apt
      apt::key { 'pagerduty':
        key        => '34241874978E85F344483D714037B2209E65C6CB',
        key_source => 'https://packages.pagerduty.com/GPG-KEY-pagerduty',
      }
      -> apt::source { 'pdagent':
        location    => 'https://packages.pagerduty.com/pdagent',
        release     => '',
        repos       => 'deb/',
        include_src => false,
        key         => '34241874978E85F344483D714037B2209E65C6CB',
      }
    }
    'RedHat', 'Amazon': {
      yumrepo { 'pdagent':
        ensure   => present,
        name     => 'PDAgent',
        baseurl  => 'https://packages.pagerduty.com/pdagent/rpm',
        enabled  => true,
        gpgcheck => true,
        gpgkey   => 'https://packages.pagerduty.com/GPG-KEY-RPM-pagerduty',
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
