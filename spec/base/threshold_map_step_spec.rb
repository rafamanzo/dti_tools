# This file is part of DTITools
# Copyright (C) 2014  it's respectives authors (please see the AUTHORS file)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe DTITools::Base::ThresholdMapStep do
  subject { DTITools::Base::ThresholdMapStep.new('test') }

  describe 'validate_args' do
    before :each do
      ARGV = []
      $stderr = File.open(File::NULL, "w")
    end

    context 'without enough arguments' do
      it 'exits' do
        expect {subject.validate_args}.to raise_error(SystemExit)
      end
    end

    context 'with three arguments' do
      before :each do
        ARGV = Array.new(3, "")
      end

      context 'with a existent tensor' do
        before :each do
          ARGV[0] = File.path(__FILE__)
        end

        context 'with a existent mask' do
          before :each do
            ARGV[1] = File.path(__FILE__)
          end

          it 'returns true' do
            subject.validate_args.should be_true
          end
        end

        context 'with a inexistent mask' do
          before :each do
            ARGV[1] = File.join(File.dirname(__FILE__), "inexistent.test")
          end

          it 'exits' do
            expect {subject.validate_args}.to raise_error(SystemExit)
          end
        end
      end

      context 'with a inexistent tensor' do
        before :each do
          ARGV[0] = File.join(File.dirname(__FILE__), "inexistent.test")
        end

        it 'exits' do
          expect {subject.validate_args}.to raise_error(SystemExit)
        end
      end
    end

    after :each do
      $stderr = STDERR
    end
  end

  describe 'load_data' do
    before :each do
      ARGV = []
      ARGV << 'test_tensor'
      ARGV << 'test_mask'
      ARGV << "1.5"

      n_img = mock('NImage')
      n_img.expects(:shape).returns([0,0,0])

      n_obj = mock('NObject')
      n_obj.expects(:get_nimage).times(3).returns(n_img)
      n_obj.expects(:header).returns({})
      n_obj.expects(:header=).with({}).returns({})
      n_obj.expects(:extended_header).returns({})
      n_obj.expects(:extended_header=).with({}).returns({})
      n_obj.expects(:image=).with(anything).returns([])

      NIFTI::NObject.expects(:new).with().returns(n_obj)
      NIFTI::NObject.expects(:new).with('test_mask').returns(n_obj)
      NIFTI::NObject.expects(:new).with('test_tensor').returns(n_obj)
    end

    it 'loads everything' do
      subject.load_data
    end
  end

  describe 'check_threshold' do
    it 'raises an exception' do
      expect { subject.check_threshold(nil) }.to raise_error(NotImplementedError)
    end
  end

  describe 'process_paritition' do
    let!(:threshold_data) { NIFTI::NImage.new(Array.new(8, 0), [3, 2, 2, 2]) }

    before :each do
      mask_data = NIFTI::NImage.new(Array.new(8, 0), [3, 2, 2, 2])
      mask_data[0][0][0] = 1
      subject.expects(:__mask_data).times(8).returns(mask_data)
      subject.expects(:__threshold_data).returns(threshold_data)
      subject.expects(:check_threshold).returns(true)
    end

    it 'sets the threshold_data at (0,0,0) to 1' do
      subject.process_partition(0..1, 0..1, 0..1)

      threshold_data[0][0][0].should eq(1)
    end
  end

  describe 'save' do
    let!(:threshold_mask) {mock('ThresholdMask')}

    before :each do
      subject.expects(:__threshold_mask).returns(threshold_mask)
    end

    it 'calls NIFTI::NWrite to save' do
      n_wrt = mock('NWrite')
      n_wrt.expects(:write).returns(true)
      NIFTI::NWrite.expects(:new).with(threshold_mask, "test.nii.gz").returns(n_wrt)

      subject.save
    end
  end
end