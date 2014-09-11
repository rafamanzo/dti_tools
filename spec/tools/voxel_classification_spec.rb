require 'spec_helper'

describe DTITools::Tools::VoxelClassification do
  describe 'load_acquisition_directions' do
    let(:path) { "test/test.dat" }

    context 'when the file path exists' do
      before do
        File.stubs(:exists?).with(path).returns(true)
      end

      let(:acquisition_direction){ FactoryGirl.build(:acquisition_direction) }
      let(:read_lines){ ["3", "-1.0 0.0 0.0", "0.0 -1.0 0.0", "0.0 0.0 1.0", "0.0"]}

      it 'is expected to create new AcquisitionDirections' do
        IO.expects(:readlines).with(path).returns(read_lines)
        DTITools::Tools::VoxelClassification.expects(:puts)

        acquisition_directions = DTITools::Tools::VoxelClassification.load_acquisition_directions(path)

        expect(acquisition_directions).to be_a(Array)
        expect(acquisition_directions.first).to be_a(DTITools::Tools::VoxelClassification::AcquisitionDirection)
      end
    end

    context 'when the file path does not exists' do
      before do
        File.stubs(:exists?).with(path).returns(false)
      end

      it 'is expected to raise a RuntimeError' do
        expect { DTITools::Tools::VoxelClassification.load_acquisition_directions(path) }.to raise_error(RuntimeError)
      end
    end
  end
end