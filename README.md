# puppet-module-utils

This module manages arbitrary installation of utilities.

Takes no action if no packages are specified.

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-utils.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-utils)

===

# Compatibility

Systems with package repositories that only need the name of the
packages passed to the package resource. Meant to work with Puppet v3
with and without the future parser and Puppet v4 with Ruby versions
1.8.7, 1.9.3, 2.0.0, 2.1.0 and 2.3.1.

===

# Parameters

packages
--------
Array of packages to install.

- *Default*: 'UNSET'

provider
--------
*String* to denote name of provider.

- *Default*: undef

enable_hiera_array
------------------
Boolean to enable the use hiera_array to lookup variable packages

- *Default*: false
