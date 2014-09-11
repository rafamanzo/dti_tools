require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2 do
  let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

  describe 'y_2_m2' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.y_2_m2(acquisition_direction)).to be_a(Float)
    end
  end

  describe 'y_2_m1' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.y_2_m1(acquisition_direction)).to be_a(Float)
    end
  end

  describe 'y_2_0' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.y_2_0(acquisition_direction)).to be_a(Float)
    end
  end

  describe 'y_2_1' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.y_2_1(acquisition_direction)).to be_a(Float)
    end
  end

  describe 'y_2_2' do
    it 'is expected to return a Float' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.y_2_2(acquisition_direction)).to be_a(Float)
    end
  end
end