# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'nix class' do
  context 'default parameters' do
    it 'works idempotently with no errors' do
      pp = <<-EOS
        class { 'nix': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe service('nix-daemon') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe file('/etc/nix/nix.conf') do
      it { is_expected.to exist }
    end
  end
end
