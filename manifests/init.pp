# == Class: utils
#
# This module manages arbitrary installation of utilities.
#
# Takes no action if no packages are specified.
#
class utils (
  $packages = 'UNSET',
  $packages_enable_hiera_array = undef,
) {

  if $packages != 'UNSET' {
    if $packages_enable_hiera_array != undef {
      $packages_real = hiera_array('utils::packages')
    } else {
      $packages_real = $packages
    }
    package { $packages_real:
      ensure => present,
    }
  }
}
