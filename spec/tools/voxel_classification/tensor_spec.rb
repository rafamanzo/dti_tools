require 'spec_helper'

describe DTITools::Tools::VoxelClassification::Tensor do
  describe 'initialize' do
    it 'is expected to return a matrix' do
      expect(DTITools::Tools::VoxelClassification::Tensor.new.matrix).to be_a(Matrix)
    end
  end
end