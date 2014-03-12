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

describe DTITools::Base::Step do
  describe 'valid_args?' do
    it 'raises an exception' do
      expect { subject.valid_args? }.to raise_error(NotImplementedError)
    end
  end

  describe 'load_data' do
    it 'raises an exception' do
      expect { subject.load_data }.to raise_error(NotImplementedError)
    end
  end

  describe 'process' do
    it 'raises an exception' do
      expect { subject.process }.to raise_error(NotImplementedError)
    end
  end

  describe 'save' do
    it 'raises an exception' do
      expect { subject.save }.to raise_error(NotImplementedError)
    end
  end

  describe 'run' do
    context 'with valid arguments' do
      before :each do
        subject.expects(:valid_args?).returns(true)
      end

      it 'calls the other methods' do
        subject.expects(:load_data)
        subject.expects(:process)
        subject.expects(:save)

        subject.run
      end
    end

    context 'with invalid arguments' do
      before :each do
        subject.expects(:valid_args?).returns(false)
      end

      it 'returns false' do
        subject.run.should be_false
      end
    end
  end
end