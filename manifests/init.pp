# ## Class: utils ##
#
# This module manages arbitrary installations of utilities.
#
# Takes no action if no packages are specified.
#
# ### Parameters ###
#
# packages
# --------
#
# Array of packages to install.
#
# - *Default*: 'UNSET'
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
