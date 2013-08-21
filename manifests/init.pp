# == Class: utils
#
# This module manages arbitrary installation of utilities.
#
# Takes no action if no packages are specified.
#
class utils (
  $packages = 'UNSET',
) {

  if $packages != 'UNSET' {
    package { $packages:
      ensure => present,
    }
  }
}
