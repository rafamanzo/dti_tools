require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4 do
  let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

  describe 'y_4_m4' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_m4(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_m3' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_m3(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_m2' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_m2(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_m1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_m1(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_0' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_0(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_1' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_1(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_2' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_2(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_3' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_3(acquisition_direction)).to be_a(Complex)
    end
  end

  describe 'y_4_4' do
    it 'is expected to return a Complex' do
      expect(DTITools::Tools::VoxelClassification::SphericalHarmonics::Order4.y_4_4(acquisition_direction)).to be_a(Complex)
    end
  end
end