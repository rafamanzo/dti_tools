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

describe DTITools::Base::CPUParallelStep do
  describe 'process_partition' do
    it 'raises an exception' do
      expect { subject.process_partition(0..1,0..1,0..1) }.to raise_error(NotImplementedError)
    end
  end

  describe 'process' do
    before :each do
      subject.expects(:processors_count).returns(2)
      subject.expects(:__shape).at_least_once.returns([5,3,3,1])
      subject.expects(:process_partition).twice.returns(true)
    end

    it 'creates workers' do
      subject.process.should be_true
    end
  end

  describe 'processors_count' do
    it 'calls Facter' do
      Facter.loadfacts
      Facter.expects(:loadfacts).returns(true)
      Facter::Application.expects(:run).with(['processorcount']).returns(lambda {puts "2"})

      subject.processors_count
    end
  end
end