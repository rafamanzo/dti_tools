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

require 'facter'

module DTITools
  module Base
    class CPUParallelStep < Step
      attr_accessor :__workers, :__shape

      def initialize
        self.__workers = []
        self.__shape = [0,0,0,0]
      end

      def process_partition(x_range, y_range, z_range); raise NotImplementedError; end

      def process
        workers_count = processors_count

        partition_size = (self.__shape[0]/workers_count).to_i
        extra_size = self.__shape[0]%workers_count

        (1..(workers_count)).each do |worker_id|
          start_worker(workers_count, partition_size, extra_size)
        end

        join_workers

        return true
      end

      def processors_count
        Facter.loadfacts
        out = StringIO.new
        $stdout = out
        Facter::Application.run(['processorcount'])
        $stdout = STDOUT

        out.string.to_i
      end

      private

      def start_worker(workers_count, partition_size, extra_size)
        worker_id = self.__workers.count + 1

        if worker_id == workers_count
          self.__workers << Thread.new { self.process_partition(((worker_id - 1)*partition_size..(worker_id*partition_size + extra_size)),
                                                           (0..self.__shape[1]),
                                                           (0..self.__shape[2])
                                                          )
                                       }
        else
          self.__workers << Thread.new { self.process_partition(((worker_id - 1)*partition_size..worker_id*partition_size),
                                                           (0..self.__shape[1]),
                                                           (0..self.__shape[2])
                                                          )
                                       }
        end
      end

      def join_workers
        self.__workers.each { |worker| worker.join }
      end
    end
  end
end