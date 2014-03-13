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

require 'nifti'
require 'dti_tools/aux/input_validators'

module DTITools
  module Base
    class ThresholdMapStep < CPUParallelStep
      include DTITools::Aux::InputValidators

      attr_accessor :__file_prefix, :__threshold, :__tensor_data, :__mask_data, :__threshold_mask, :__threshold_mask_data

      def initialize(file_prefix, tensor_file, mask_file, threshold)
        super()
        self.__file_prefix = file_prefix

        self.__threshold = threshold.to_f

        self.__tensor_data = NIFTI::NObject.new(tensor_file).get_nimage

        mask = NIFTI::NObject.new(self.__mask_file)
        self.__mask_data = mask.get_nimage

        self.__threshold_mask = NIFTI::NObject.new
        self.__threshold_mask.header = mask.header
        self.__threshold_mask.extended_header = mask.extended_header
        self.__threshold_mask.image = Array.new(self.__shape[0]*self.__shape[1]*self.__shape[2], 0)
        self.__threshold_mask_data = self.__threshold_mask.get_nimage
      end

      def check_threshold(tensor); raise NotImplementedError; end

      def process_partition(x_range, y_range, z_range)
        x_range.each do |x|
          y_range.each do |y|
            z_range.each do |z|
              if self.__mask_data[x][y][z] == 1 && self.check_threshold(self.__tensor_data[x][y][z][0..5])
                self.__threshold_data[x][y][z] = 1
              end
            end
          end
        end
      end

      def save
        NIFTI::NWrite.new(self.__threshold_mask, "#{self.__file_prefix}.nii.gz").write
      end
    end
  end
end