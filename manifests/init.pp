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

  $enable_hiera_array_type = type3x($enable_hiera_array)

  case $enable_hiera_array_type {
    'string': {
      $enable_hiera_array_real = str2bool($enable_hiera_array)
    }
    'boolean': {
      $enable_hiera_array_real = $enable_hiera_array
    }
    default: {
      fail("utils::enable_hiera_array must be of type boolean or string. Detected type is <${enable_hiera_array_type}>.")
    }
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
