require 'spec_helper'

describe DTITools::Tools::VoxelClassification::Model do
  subject { FactoryGirl.build(:model) }

  describe 'value' do
    let!(:series){ FactoryGirl.build(:shs_coefficients) }
    let!(:tensor){ FactoryGirl.build(:tensor) }
    let!(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

    subject { DTITools::Tools::VoxelClassification::Model.new(order: 0, coefficients: series.coefficients([tensor.adc(acquisition_direction)])) }

    it 'is expected to be a Complex' do
      expect(subject.value(acquisition_direction)).to be_a(Complex)
    end
  end
end