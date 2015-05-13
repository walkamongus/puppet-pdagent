# == Class pdagent::repo
#
# This class is called from pdagent for repo.
#
class pdagent::repo {

  case $::osfamily {
    'Debian': {
      include ::apt
      apt::source { 'pagerduty':
        location => 'http://packages.pagerduty.com/pdagent',
        repos    => 'deb',
        key      => {
          'id'     => '34241874978E85F344483D714037B2209E65C6CB',
          'server' => 'http://packages.pagerduty.com/GPG-KEY-pagerduty',
        },
      }
    }
    'RedHat', 'Amazon': {
      yumrepo { 'pagerduty':
        name     => 'PDAgent',
        baseurl  => 'http://packages.pagerduty.com/pdagent/rpm',
        enabled  => true,
        gpgcheck => true,
        gpgkey   => 'http://packages.pagerduty.com/GPG-KEY-RPM-pagerduty',
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
