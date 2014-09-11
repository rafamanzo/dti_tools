require 'matrix'

module DTITools
  module Tools
    module VoxelClassification
      class Tensor
        attr_reader :matrix

        def initialize(attributes={})
          @matrix = Matrix[[attributes[:dxx], attributes[:dxy], attributes[:dxz]],
                           [attributes[:dxy], attributes[:dyy], attributes[:dyz]],
                           [attributes[:dxz], attributes[:dyz], attributes[:dzz]]
                          ]
        end

        def apparent_diffusion_coefficient(acquisition_direction)
          (acquisition_direction.vector.transpose*self.matrix*acquisition_direction.vector)[0,0]
        end
        alias_method :adc, :apparent_diffusion_coefficient
      end
    end
  end
end