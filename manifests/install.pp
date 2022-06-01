# == Class: nix::install
#
# Install nix using the multi user installation script
#
class nix::install {

  file {
    '/tmp/install.sh':
      source => "https://releases.nixos.org/nix/nix-${nix::version}/install"
  }

  user {
    'nix':
      shell => '/sbin/nologin'
  }

  include ::sudo

  sudo::conf { 'nix':
    ensure  => 'present',
    content => 'nix ALL=(ALL) NOPASSWD: ALL'
  }

  if $nix::multi_user {
    $install_options = '--daemon'
  } else {
    $install_options = '--no-daemon'
  }

  exec {
    'run install.sh':
      command     => "/bin/bash /tmp/install.sh ${install_options}",
      user        => 'nix',
      environment => ['HOME=/tmp', 'ALLOW_PREEXISTING_INSTALLATION=1'],
      creates     => '/nix/store',
      require     => [Sudo::Conf['nix']]
  }

}
