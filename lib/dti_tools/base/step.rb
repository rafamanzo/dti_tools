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
  module Base
    class Step
      def valid_args?; raise NotImplementedError; end

      def load_data; raise NotImplementedError; end

      def process; raise NotImplementedError; end

      def save; raise NotImplementedError; end

      def run
        if self.valid_args?
          self.load_data
          self.process
          self.save
        else
          return false
        end
      end
    end
  end
end