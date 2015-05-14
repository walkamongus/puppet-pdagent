require 'spec_helper'

describe 'pdagent' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "pdagent class without any parameters" do
          let(:params) {{ }}
          
          case os
          when /debian/
            it { should contain_class('apt') }
            it { should contain_apt__key('pagerduty').with(
              'key'        => '34241874978E85F344483D714037B2209E65C6CB',
              'key_source' => 'http://packages.pagerduty.com/GPG-KEY-pagerduty'
            ) }
            it { should contain_apt__source('pdagent').with(
              'location'    => 'http://packages.pagerduty.com/pdagent',
              'release'     => '',
              'repos'       => 'deb/',
              'include_src' => 'false'
            ) }
          when /redhat/
            it { is_expected.to contain_yumrepo('pdagent').with(
              'ensure'   => 'present',
              'name'     => 'PDAgent',
              'baseurl'  => 'http://packages.pagerduty.com/pdagent/rpm',
              'enabled'  => 'true',
              'gpgcheck' => 'true',
              'gpgkey'   => 'http://packages.pagerduty.com/GPG-KEY-RPM-pagerduty'
            ) }
          end

        end
      end
    end
  end
end
