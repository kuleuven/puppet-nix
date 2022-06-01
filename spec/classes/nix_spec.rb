require 'spec_helper'

describe 'nix' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }
    context "on #{os}" do
      context 'when using defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_user('nix') }
      end
    end
  end
end
