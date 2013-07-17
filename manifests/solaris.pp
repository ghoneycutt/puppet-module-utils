# ## Class:  pkg_solaris ##
#
# Manage solaris packages path
#
# ### Parameters ###
#
#
class  utils::solaris inherits utils
{
  package { 'sudo':
    provider  => 'sun',
    adminfile => tests('packages/solaris.erb'),
    ensure    => latest,
  }

  if $::is_virtual => 'true' {
  package { 'VMware Tools':
    provider          => 'vmware',
    ensure            => absent,
    uninstall_options =>  [{'REMOVE' => 'Sync,VSS' }]
  }
  }
}
