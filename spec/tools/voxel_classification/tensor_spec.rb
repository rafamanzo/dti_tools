require 'spec_helper'

describe DTITools::Tools::VoxelClassification::Tensor do
  describe 'initialize' do
    it 'is expected to return a matrix' do
      expect(DTITools::Tools::VoxelClassification::Tensor.new.matrix).to be_a(Matrix)
    end
  end

  describe 'apparent_diffusion_coefficient' do
    let(:tensor){ FactoryGirl.build(:tensor) }
    let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

    it 'is expected to return the coefficient' do
      expect(tensor.adc(acquisition_direction)).to eq(1)
    end
  end
end