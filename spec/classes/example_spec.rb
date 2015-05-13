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

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('pdagent::params') }
          it { is_expected.to contain_class('pdagent::install').that_comes_before('pdagent::config') }
          it { is_expected.to contain_class('pdagent::config') }
          it { is_expected.to contain_class('pdagent::service').that_subscribes_to('pdagent::config') }

          it { is_expected.to contain_service('pdagent') }
          it { is_expected.to contain_package('pdagent').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'pdagent class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('pdagent') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
