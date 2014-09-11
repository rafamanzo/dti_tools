module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        class Order1
          def self.y_1_m1(acquisition_direction)
            (1.0/2.0)*Math.sqrt(3.0/(2.0*Math::PI))*((acquisition_direction.x - Complex(0, acquisition_direction.y))/acquisition_direction.r)
          end

          def self.y_1_0(acquisition_direction)
            Complex((1.0/2.0)*Math.sqrt(3.0/Math::PI)*(acquisition_direction.z/acquisition_direction.r), 0)
          end

          def self.y_1_1(acquisition_direction)
            (-1.0/2.0)*Math.sqrt(3.0/(2.0*Math::PI))*((acquisition_direction.x + Complex(0, acquisition_direction.y))/acquisition_direction.r)
          end
        end
      end
    end
  end
end