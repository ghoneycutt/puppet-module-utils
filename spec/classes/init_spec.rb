require 'spec_helper'
describe 'utils' do

  it { should compile.with_all_deps }

  describe 'with parameter packages set to UNSET as a string' do
    let :params do
      { :packages => 'UNSET' }
    end

    it { should_not contain_package('UNSET').with_ensure('present') }
    it { should have_resource_count(0) }
  end

  describe 'with parameter provider' do
    context 'set to a valid string' do
      let :params do
        { :packages => ['rake','rspec'],
          :provider => 'gem',
        }
      end

      it {
        should contain_package('rake').with({
          'ensure'   => 'present',
          'provider' => 'gem',
        })
      }

      it {
        should contain_package('rspec').with({
          'ensure'   => 'present',
          'provider' => 'gem',
        })
      }
    end

    context 'set to an invalid type (non-string)' do
      let :params do
        { :packages => ['rake','rspec'],
          :provider => true,
        }
      end

      it 'should fail' do
        expect {
          should contain_class('utils')
        }.to raise_error(Puppet::Error)
      end
    end
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

  # GH: TODO: figure out how to stub hiera_array() or set packages_real directly.
  describe 'with enable_hiera_array parameter set to boolean true' do
    let(:params) { { :enable_hiera_array => true } }
  end

  # GH: TODO: figure out how to stub hiera_array() or set packages_real directly.
  describe 'with enable_hiera_array parameter set to stringified \'true\'' do
    let(:params) { { :enable_hiera_array => 'true' } }
  end

  # GH: TODO: figure out how to stub hiera_array() or set packages_real directly.
  describe 'with enable_hiera_array parameter set to true and no packages return from hiera' do
    let(:params) { { :enable_hiera_array => 'true' } }

    it { should have_resource_count(0) }
  end

  describe 'with enable_hiera_array parameter set to invalid type (array)' do
    let(:params) { { :enable_hiera_array => [ 'not', 'a', 'valid', 'type' ] } }

    it 'should fail' do
      expect {
        should contain_class('utils')
      }.to raise_error(Puppet::Error)
    end
  end
end
