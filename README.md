# puppet-module-utils

This module manages arbitrary installation of utilities.

Takes no action if no packages are specified.

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-utils.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-utils)

===

# Compatibility

Systems with package repositories that only need the name of the packages passed to the package resource.

===

# Parameters

packages
--------
Array of packages to install.

- *Default*: 'UNSET'

packages_enable_hiera_array
---------------------------
Enable the use hiera_array to lookup variable packages

- *Default*: undef
