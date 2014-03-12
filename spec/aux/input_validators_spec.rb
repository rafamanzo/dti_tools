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
require 'dti_tools/aux/input_validators'

include DTITools::Aux::InputValidators

describe 'InputValidators' do
  before do
    ARGV = []
  end

  describe 'validate_tensor' do
    context 'with an existing file' do
      before do
        ARGV << File.path(__FILE__)
      end

      it 'returns true' do
        validate_tensor(0).should be_true
      end

      after do
        ARGV = []
      end
    end

    context 'with an inexistent file' do
      before do
        ARGV << File.join(File.dirname(__FILE__), 'inexistent.in')
      end

      it 'raises ArgumentError' do
        expect{ validate_tensor(0) }.to raise_error(ArgumentError)
      end

      after do
        ARGV = []
      end
    end
  end

  describe 'validate_mask' do
    context 'with an existing file' do
      before do
        ARGV << File.path(__FILE__)
      end

      it 'returns true' do
        validate_mask(0).should be_true
      end

      after do
        ARGV = []
      end
    end

    context 'with an inexistent file' do
      before do
        ARGV << File.join(File.dirname(__FILE__), 'inexistent.in')
      end

      it 'raises ArgumentError' do
        expect{ validate_mask(0) }.to raise_error(ArgumentError)
      end

      after do
        ARGV = []
      end
    end
  end

  describe 'validate_tensor_and_mask' do
    context 'with an existent tensor' do
      before :each do
        self.expects(:validate_tensor).with(0).returns(true)
      end

      context 'with an existent mask' do
        before :each do
          self.expects(:validate_mask).with(1).returns(true)
        end

        it 'returns true' do
          validate_tensor_and_mask(0,1).should be_true
        end
      end

      context 'with an inexistent mask' do
        before :each do
          self.expects(:validate_mask).with(1).returns(false)
        end

        it 'returns false' do
          validate_tensor_and_mask(0,1).should be_false
        end
      end
    end

    context 'with an inexistent tensor' do
      before :each do
        self.expects(:validate_tensor).with(0).returns(false)
      end

      it 'returns false' do
        validate_tensor_and_mask(0,1).should be_false
      end
    end
  end
end