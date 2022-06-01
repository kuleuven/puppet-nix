# == Class: nix
#
# Install and configure nix - the package manager
# 
class nix (
  Variant[String, Enum['present', 'absent']] $ensure = 'present',
  String $version = '2.9.0',
  Boolean $multi_user = true,
  Array[String] $experimental_features = [],
  Array[String] $trusted_users = ['root'],
  Array[String] $allowed_users = ['*'],
  Array[String] $substituters = ['https://cache.nixos.org'],
  Array[String] $trusted_public_keys = ['cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY='],
  Array[String] $system_features = ['nixos-test', 'benchmark', 'big-parallel', 'kvm']
) {

  if $ensure == 'present' {
    include ::nix::install
    include ::nix::config
  }
}
