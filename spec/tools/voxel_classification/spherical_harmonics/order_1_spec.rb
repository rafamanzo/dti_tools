require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics::Order1 do
  let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

  describe 'y_1_m1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order1.y_1_m1(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_1_0' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order1.y_1_0(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_1_1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order1.y_1_1(acquisition_direction)).to be_a(Complex)
    end
  end
end