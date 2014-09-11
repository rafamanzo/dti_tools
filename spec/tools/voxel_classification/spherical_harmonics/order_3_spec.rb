require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3 do
  let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

  describe 'y_3_m3' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_m3(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_m2' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_m2(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_m1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_m1(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_0' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_0(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_1(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_2' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_2(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_3_3' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order3.y_3_3(acquisition_direction)).to be_a(Complex)
    end
  end
end