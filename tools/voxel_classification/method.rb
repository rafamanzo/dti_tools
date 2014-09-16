require 'c_nifti'

module DTITools
  module Tools
    module VoxelClassification
      class Method
        def initialize(attributes={})
          @tensor_data = TensorData.new(image_path: attributes[:tensor_image_path])
          @mask = Mask.new(image_path: attributes[:mask_image_path])
          @classification = CNifti::Image.new(dimensions: @mask.shape)
          @acquisition_directions = VoxelClassification.load_acquisition_directions(attributes[:acquisition_directions_path])

          @significance_level = attributes[:significance_level]
          @output_path = attributes[:output_path]
        end

        def classify; end
      end
    end
  end
end
