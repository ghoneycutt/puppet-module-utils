require 'spec_helper'
describe 'utils' do

  describe 'with parameter packages set to UNSET as a string' do
    let :params do
      { :packages => 'UNSET' }
    end

    it { should_not contain_package('UNSET').with_ensure('present') }
  end

  describe 'with parameter packages set as a string' do
    let :params do
      { :packages => 'valid_package' }
    end

    it { should contain_package('valid_package').with_ensure('present') }
  end

  describe 'with parameter packages set as an array' do
    let :params do
      { :packages => [ 'valid-package1', 'valid-package2' ] }
    end

    it { should contain_package('valid-package1').with_ensure('present') }
    it { should contain_package('valid-package2').with_ensure('present') }
  end

end
