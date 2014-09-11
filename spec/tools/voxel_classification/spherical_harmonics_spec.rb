require 'spec_helper'

describe DTITools::Tools::VoxelClassification::SphericalHarmonics do
  describe 'y' do
    let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }

    context 'with a defined order' do
      context 'with a defined step' do
        it 'is expected to call the method' do
          DTITools::Tools::VoxelClassification::SphericalHarmonics::Order2.expects(:y_2_m1).with(acquisition_direction)

          DTITools::Tools::VoxelClassification::SphericalHarmonics.y(2, -1, acquisition_direction)
        end
      end

      context 'with a undefined step' do
        it 'is expected to raise a RuntimeError' do
          expect{ DTITools::Tools::VoxelClassification::SphericalHarmonics.y(0, 1024, acquisition_direction) }.to raise_error(RuntimeError)
        end
      end
    end

    context 'with a undefined order' do
      it 'is expected to raise a RuntimeError' do
        expect{ DTITools::Tools::VoxelClassification::SphericalHarmonics.y(1024, 1024, acquisition_direction) }.to raise_error(RuntimeError)
      end
    end
  end
end