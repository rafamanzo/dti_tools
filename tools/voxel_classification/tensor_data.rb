require 'c_nifti'

module DTITools
  module Tools
    module VoxelClassification
      class TensorData
        def initialize(attributes={})
          @image = CNifti::Image.new.open(attributes[:image_path])
        end

        def[](i,j,k)
          compact_tensor = @image.data[i][j][k][0..5]

          Tensor.new(dxx: compact_tensor[0], dxy: compact_tensor[1], dxz: compact_tensor[2],
                                             dyy: compact_tensor[3], dyz: compact_tensor[4],
                                                                     dzz: compact_tensor[5])
        end
      end
    end
  end
end