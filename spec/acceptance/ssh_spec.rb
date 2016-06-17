require 'spec_helper_acceptance'

describe 'ssh' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include ssh 
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
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
