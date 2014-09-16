require 'spec_helper'
require 'matrix'

describe DTITools::Tools::VoxelClassification::SHSeriesCoefficients do
  describe 'coefficients' do
    subject(:series){ DTITools::Tools::VoxelClassification::SHSeriesCoefficients.new([[1,0,0]], 0) }

    it 'is expected to return a Matrix' do
      expect(series.coefficients([1])).to be_a(Matrix)
    end
  end
end