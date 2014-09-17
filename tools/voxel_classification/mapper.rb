require 'c_nifti'

module DTITools
  module Tools
    module VoxelClassification
      class Mapper
        def initialize(attributes={})
          @tensor_data = TensorData.new(image_path: attributes[:tensor_image_path])
          @mask = Mask.new(image_path: attributes[:mask_image_path])
          @classification = CNifti::Image.new(dimensions: @mask.shape)
          @classifier = Classifier.new(significance_level: attributes[:significance_level],
                                       acquisition_directions: VoxelClassification.load_acquisition_directions(attributes[:acquisition_directions_path]))
          @output_path = attributes[:output_path]
        end

        def classify
          (0..@mask.shape[0]).each do |i|
            (0..@mask.shape[1]).each do |j|
              (0..@mask.shape[2]).each do |k|
                if @mask.in?(i,j,k)
                  @classification[i][j][k] = @classifier.classify(@tensor_data[i,j,k])
                end
              end
            end
          end
        end

        def save
          @classification.save_as(@output_path)
        end
      end
    end
  end
end
