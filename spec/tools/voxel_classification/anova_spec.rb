require 'spec_helper'

describe DTITools::Tools::VoxelClassification::Anova do
  describe 'equivalent?' do
    let!(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }
    let!(:tensor){ FactoryGirl.build(:tensor) }
    let!(:series){ FactoryGirl.build(:shs_coefficients, acquisition_directions: [acquisition_direction, acquisition_direction, acquisition_direction]) }
    let!(:model_a){ DTITools::Tools::VoxelClassification::Model.new(order: 0, coefficients: series.coefficients([tensor.adc(acquisition_direction), tensor.adc(acquisition_direction), tensor.adc(acquisition_direction)])) }
    let!(:model_b){ DTITools::Tools::VoxelClassification::Model.new(order: 0, coefficients: series.coefficients([tensor.adc(acquisition_direction), tensor.adc(acquisition_direction), tensor.adc(acquisition_direction)])) }

    subject { DTITools::Tools::VoxelClassification::Anova.new(model_a: model_a, model_b: model_b, acquisition_directions: [acquisition_direction, acquisition_direction, acquisition_direction], tensor: tensor) }

    it 'is expected to be a boolean' do
      pending 'needs a better setup'
      Distribution::F.expects(:p_value).returns(1.0)
      expect(subject.equivalent?(0.05)).to be_truthy
    end
  end
end