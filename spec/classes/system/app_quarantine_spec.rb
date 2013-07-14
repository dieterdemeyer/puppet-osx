require 'spec_helper'

describe 'osx::system::app_quarantine' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Downloaded App Quarantine').with({
        :user   => facts[:boxen_user],
        :key    => 'LSQuarantine',
        :domain => 'com.apple.LaunchServices',
        :value  => params[:enabled],
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the Downloaded App Quarantine').with({
        :user   => facts[:boxen_user],
        :key    => 'LSQuarantine',
        :domain => 'com.apple.LaunchServices',
        :value  => params[:enabled],
      })
    end
  end

end
