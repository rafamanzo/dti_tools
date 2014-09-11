require 'spec_helper'

describe DTITools::Tools::VoxelClassification::AcquisitionDirection do
  subject { FactoryGirl.build(:acquisition_direction) }

  describe 'x' do
    it 'is expected to return a Float' do
      expect(subject.x).to be_a(Float)
    end
  end

  describe 'y' do
    it 'is expected to return a Float' do
      expect(subject.y).to be_a(Float)
    end
  end

  describe 'z' do
    it 'is expected to return a Float' do
      expect(subject.z).to be_a(Float)
    end
  end

  describe 'r' do
    it 'is expected to return a Float' do
      expect(subject.r).to be_a(Float)
    end
  end

  describe 'vector' do
    it 'is expected to return a Matrix' do
      expect(subject.vector).to be_a(Matrix)
    end
  end
end