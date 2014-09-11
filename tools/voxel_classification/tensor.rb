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
      end
    end
  end
end