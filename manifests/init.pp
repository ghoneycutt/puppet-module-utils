# == Class: utils
#
# This module manages arbitrary installation of utilities.
#
# Takes no action if no packages are specified.
#
class utils (
  $packages           = 'UNSET',
  $provider           = undef,
  $enable_hiera_array = false,
) {

  if is_string($enable_hiera_array) {
    $enable_hiera_array_real = str2bool($enable_hiera_array)
  } elsif is_bool($enable_hiera_array) {
    $enable_hiera_array_real = $enable_hiera_array
  } else {
    fail('utils::enable_hiera_array must be of type boolean or string.')
  }

  if $provider != undef {
    validate_string($provider)
  }

  if $packages != 'UNSET' {
    if $enable_hiera_array_real == true {
      $packages_real = hiera_array('utils::packages')
    } else {
      $packages_real = $packages
    }
  }

  if $packages_real {
    package { $packages_real:
      ensure   => present,
      provider => $provider,
    }
  }
}
