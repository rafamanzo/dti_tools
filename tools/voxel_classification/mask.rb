require 'c_nifti'

module DTITools
  module Tools
    module VoxelClassification
      class Mask
        def initialize(attributes={})
          @image = CNifti::Image.new.open(attributes[:image_path])
        end

        def[](i,j,k)
          @image.data[i][j][k]
        end

        def out?(i,j,k)
          self[i,j,k] == 0
        end

        def in?(i,j,k)
          !self.out?(i,j,k)
        end
      end
    end
  end
end