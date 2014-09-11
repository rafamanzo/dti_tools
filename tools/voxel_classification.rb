require "#{File.dirname(__FILE__)}/voxel_classification/acquisition_direction"
require "#{File.dirname(__FILE__)}/voxel_classification/spherical_harmonics"
require "#{File.dirname(__FILE__)}/voxel_classification/tensor"
require "#{File.dirname(__FILE__)}/voxel_classification/tensor_data"

module DTITools
  module Tools
    module VoxelClassification
      def self.load_acquisition_directions(path)
        acquisition_directions = []

        raise RuntimeError.new("File #{path} not found") unless File.exists?(path)

        IO.readlines(path)[1..-1].each do |line|
          components = line.split.map { |e| e.to_f }
          if components.count == 3
            acquisition_directions << AcquisitionDirection.new(x: components[0], y: components[1], z: components[2])
          else
            puts "Ignored invalid line:\n\t#{line}"
          end
        end

        return acquisition_directions
      end

      def self.index(l, m)
        l**2 + l + m
      end
    end
  end
end