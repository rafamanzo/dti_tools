module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        class Order3
          def self.y_3_m3(acquisition_direction)
            (1.0/8.0)*Math.sqrt(35.0/Math::PI)*((acquisition_direction.x - Complex(0, acquisition_direction.y))**3)/acquisition_direction.r**3
          end

          def self.y_3_m2(acquisition_direction)
            (1.0/4.0)*Math.sqrt(105.0/(2.0*Math::PI))*(((acquisition_direction.x - Complex(0, acquisition_direction.y))**2)*acquisition_direction.z)/acquisition_direction.r**3
          end

          def self.y_3_m1(acquisition_direction)
            (1.0/8.0)*Math.sqrt(21.0/Math::PI)*((acquisition_direction.x - Complex(0, acquisition_direction.y))*(4.0*(acquisition_direction.z**2) - acquisition_direction.x**2 - acquisition_direction.y**2))/acquisition_direction.r**3
          end

          def self.y_3_0(acquisition_direction)
            Complex((1.0/4.0)*Math.sqrt(7.0/Math::PI)*((2.0*(acquisition_direction.z**2) - 3.0*(acquisition_direction.x**2) - 3.0*(acquisition_direction.y**2))*acquisition_direction.z)/acquisition_direction.r**3, 0)
          end

          def self.y_3_1(acquisition_direction)
            (-1.0/8.0)*Math.sqrt(21.0/Math::PI)*((acquisition_direction.x + Complex(0, acquisition_direction.y))*(4.0*(acquisition_direction.z**2) - acquisition_direction.x**2 - acquisition_direction.y**2))/acquisition_direction.r**3
          end

          def self.y_3_2(acquisition_direction)
            (1.0/4.0)*Math.sqrt(105.0/(2.0*Math::PI))*(((acquisition_direction.x + Complex(0, acquisition_direction.y))**2)*acquisition_direction.z)/acquisition_direction.r**3
          end

          def self.y_3_3(acquisition_direction)
            (-1.0/8.0)*Math.sqrt(35.0/Math::PI)*((acquisition_direction.x + Complex(0, acquisition_direction.y))**3)/acquisition_direction.r**3
          end
        end
      end
    end
  end
end