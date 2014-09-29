# puppet-module-utils

This module manages arbitrary installation of utilities.

Takes no action if no packages are specified.

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-utils.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-utils)

===

# Compatibility

Systems with package repositories that only need the name of the packages passed to the package resource.

===

# Parameters

provider
--------
Set provider to use.

- *Default*: 'UNSET'

packages
--------
Array of packages to install.

- *Default*: 'UNSET'

enable_hiera_array
------------------
Boolean to enable the use hiera_array to lookup variable packages

- *Default*: false
