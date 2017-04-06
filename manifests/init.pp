# == Class: bartender
#
# Install bartender
#
class bartender (
  $install_path = "/Users/${::boxen_user}/Applications/Bartender 2.app",
) {
  package { 'bartender':
    provider => 'brewcask'
  }
  -> osx_login_item { 'Bartender 2':
    hidden => true,
    path   => $install_path
  }
  ~> exec { 'launch bartender':
    command     => "/usr/bin/open '${install_path}'",
    refreshonly => true,
  }
}
