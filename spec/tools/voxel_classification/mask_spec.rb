require 'spec_helper'

describe DTITools::Tools::VoxelClassification::Mask do
  let(:image_path) {'/test/test.nii.gz'}

  describe 'initialize' do
    it 'is expected to open a image with CNifti' do
      CNifti::Image.any_instance.expects(:open).with(image_path).returns(mock('image'))

      DTITools::Tools::VoxelClassification::Mask.new(image_path: image_path)
    end
  end

  describe '[]' do
    let(:image){ mock('image') }
    let(:image_data){ [[[1]]] }

    before :each do
      image.stubs(:data).returns(image_data)
      CNifti::Image.any_instance.stubs(:open).with(image_path).returns(image)
    end

    subject { DTITools::Tools::VoxelClassification::Mask.new(image_path: image_path) }

    it 'is expected to create a new Tensor instance' do
      expect(subject[0,0,0]).to eq(1)
    end
  end

  describe 'in?' do
    let(:image){ mock('image') }
    let(:image_data){ [[[1]]] }

    before :each do
      image.stubs(:data).returns(image_data)
      CNifti::Image.any_instance.stubs(:open).with(image_path).returns(image)
    end

    subject { DTITools::Tools::VoxelClassification::Mask.new(image_path: image_path) }

    it 'is expected to return true' do
      subject.expects(:out?).with(0,0,0).returns(false)

      expect(subject.in?(0,0,0)).to be_truthy
    end
  end

  describe 'out?' do
    let(:image){ mock('image') }
    let(:image_data){ [[[1]]] }

    before :each do
      image.stubs(:data).returns(image_data)
      CNifti::Image.any_instance.stubs(:open).with(image_path).returns(image)
    end

    subject { DTITools::Tools::VoxelClassification::Mask.new(image_path: image_path) }

    it 'is expected to return true' do
      expect(subject.out?(0,0,0)).to be_falsey
    end
  end
end