module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        class Order0
          def self.y_0_0(acquisition_direction=nil)
            (1.0/2.0)*Math.sqrt(1.0/Math::PI)
          end
        end
      end
    end
  end
end