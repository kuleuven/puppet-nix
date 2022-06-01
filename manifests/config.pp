# == Class: nix::config
#
# Canfigure nix daemon
# 
class nix::config {

  file {
    '/etc/nix':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
    '/etc/nix/nix.conf':
      ensure  => present,
      content => epp('nix/nix.conf.epp'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Service['nix-daemon'],
  }

  service { 'nix-daemon':
    ensure  => 'running',
    enable  => true,
    require => [Exec['run install.sh']]
  }

}
