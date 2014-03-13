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
    class TensorIndices
      attr_reader :tensor, :tensor_matrix

      def initialize(tensor)
        @tensor_matrix = Matrix[[tensor[0], tensor[1], tensor[2]],
                                [tensor[1], tensor[3], tensor[4]],
                                [tensor[2], tensor[4], tensor[5]]]
        @tensor = tensor
      end

      def md
        (@tensor[0] + @tensor[3] + @tensor[5])/3.0
      end

      def fa
        md = self.md
        eigenvalues = self.eigensystem.eigenvalues

        numerator = Math.sqrt((eigenvalues[0] - md)**2 +
                              (eigenvalues[1] - md)**2 +
                              (eigenvalues[2] - md)**2
                             )
        denominator = Math.sqrt(eigenvalues[0]**2 +
                                eigenvalues[1]**2 +
                                eigenvalues[2]**2
                               )

        if denominator != 0.0
          numerator/denominator
        else
          0.0
        end
      end

      def eigensystem
        Matrix::EigenvalueDecomposition.new(@tensor_matrix)
      end
    end
  end
end