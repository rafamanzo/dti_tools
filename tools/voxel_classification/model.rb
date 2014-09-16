require 'c_nifti'

module DTITools
  module Tools
    module VoxelClassification
      class Model
        attr_reader :order

        def initialize(attributes={})
          @order = attributes[:order]
          @coefficients = attributes[:coefficients]
        end

        def value(acquisition_direction)
          accum = Complex(0, 0)

          (0..self.order).each do |l|
            if l%2 == 0 #odd orders are zero
              (-l..l).each do |m|
                accum += @coefficients[VoxelClassification.index(l,m), 0]*SphericalHarmonics.y(l,m, acquisition_direction)
              end
            end
          end

          return accum
        end
      end
    end
  end
end