require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics::Order0 do
  describe 'y_0_0' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order0.y_0_0).to be_a(Float)
    end
  end
end