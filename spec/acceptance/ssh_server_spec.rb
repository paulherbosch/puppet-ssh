require 'spec_helper_acceptance'

describe 'ssh::server' do

	describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include ssh
        include ssh::server
          ssh::server::config { 'PermitRootLogin':
          sshd_parameter => 'PermitRootLogin',
          sshd_value     => 'no'
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/ssh/sshd_config') do
      it { is_expected.to be_file }

      # old syntax?
      # it { should contain 'PermitRootLogin yes' }

      # new syntax?
      its(:content) { should match /PermitRootLogin no/ }
    end

		describe port(22) do
      it { is_expected.to be_listening }
    end

		describe service('sshd') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
	end

end
