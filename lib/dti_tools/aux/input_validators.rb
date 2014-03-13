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

module DTITools
  module Aux
    module InputValidators
      def validate_tensor(file)
        if !File.file?(file)
          raise ArgumentError.new("The given tensor file does not exists:\n#{file}")
        end

        return true
      end

      def validate_mask(file)
        if !File.file?(file)
          raise ArgumentError.new("The given mask file does not exists:\n#{file}")
        end

        return true
      end

      def validate_tensor_and_mask(tensor_file, mask_file)
        return (validate_tensor(tensor_file) && validate_mask(mask_file))
      end
    end
  end
end