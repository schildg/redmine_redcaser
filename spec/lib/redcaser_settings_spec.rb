require 'spec_helper'

describe RedcaserSettings do
  include SetupSupport

  context 'without initial settings' do
    before(:example) { clear_plugin_settings }

    it 'return nil for tracker id' do
      expect(RedcaserSettings.tracker_id).to be_nil
    end

    it 'return nil for status new id' do
      expect(RedcaserSettings.status_new_id).to be_nil
    end

    it 'return nil for status active id' do
      expect(RedcaserSettings.status_active_id).to be_nil
    end

    it 'return nil for status obsolete id' do
      expect(RedcaserSettings.status_obsolete_id).to be_nil
    end
  end

  context 'with initial settings' do
    before(:example) { create_base_setup_with_settings }

    it 'return nil for tracker id' do
      expect(RedcaserSettings.tracker_id).to eq(@tracker.id)
    end

    it 'return nil for status new id' do
      expect(RedcaserSettings.status_new_id).to eq(@status_new.id)
    end

    it 'return nil for status active id' do
      expect(RedcaserSettings.status_active_id).to eq(@status_active.id)
    end

    it 'return nil for status obsolete id' do
      expect(RedcaserSettings.status_obsolete_id).to eq(@status_obsolete.id)
    end
  end
end
