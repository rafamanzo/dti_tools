require "#{File.dirname(__FILE__)}/spherical_harmonics/order_0"
require "#{File.dirname(__FILE__)}/spherical_harmonics/order_1"
require "#{File.dirname(__FILE__)}/spherical_harmonics/order_2"
require "#{File.dirname(__FILE__)}/spherical_harmonics/order_3"
require "#{File.dirname(__FILE__)}/spherical_harmonics/order_4"

module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        def self.y(order, m, acquisition_direction)
          if const_defined?("Order#{order}")
            order_class = const_get("Order#{order}")
            step = m.to_s.gsub('-', 'm')

            if order_class.respond_to?("y_#{order}_#{step}")
              order_class.send("y_#{order}_#{step}", acquisition_direction)
            else
              raise RuntimeError.new("Spherical Harmonic #{order}, #{m} is not defined")
            end
          else
            raise RuntimeError.new("Spherical Harmonic with order #{order} is not defined")
          end
        end
      end
    end
  end
end