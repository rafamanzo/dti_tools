module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        class Order2
          def self.y_2_m2(acquisition_direction)
            (1.0/4.0)*Math.sqrt(15/(2.0*Math::PI))*(((acquisition_direction.x - Complex(0, acquisition_direction.y))**2)/(acquisition_direction.r**2))
          end

          def self.y_2_m1(acquisition_direction)
            (1.0/2.0)*Math.sqrt(15/(2.0*Math::PI))*(((acquisition_direction.x - Complex(0, acquisition_direction.y))*acquisition_direction.z)/(acquisition_direction.r**2))
          end

          def self.y_2_0(acquisition_direction)
            Complex(1.0/4.0*Math.sqrt(5/Math::PI)*((-acquisition_direction.x**2 - acquisition_direction.y**2 + 2.0*acquisition_direction.z**2)/(acquisition_direction.r**2)), 0)
          end

          def self.y_2_1(acquisition_direction)
            (-1.0/2.0)*Math.sqrt(15/(2.0*Math::PI))*(((acquisition_direction.x + Complex(0, acquisition_direction.y))*acquisition_direction.z)/(acquisition_direction.r**2))
          end

          def self.y_2_2(acquisition_direction)
            (1.0/4.0)*Math.sqrt(15/(2.0*Math::PI))*(((acquisition_direction.x + Complex(0, acquisition_direction.y))**2)/(acquisition_direction.r**2))
          end
        end
      end
    end
  end
end