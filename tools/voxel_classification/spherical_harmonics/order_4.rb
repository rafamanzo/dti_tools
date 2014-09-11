module DTITools
  module Tools
    module VoxelClassification
      module  SphericalHarmonics
        class Order4
          def self.y_4_m4(acquisition_direction)
            (3.0/4.0)*Math.sqrt(35.0/Math::PI)*((acquisition_direction.x*acquisition_direction.y*(acquisition_direction.x**2 - acquisition_direction.y**2))/acquisition_direction.r**4)
          end

          def self.y_4_m3(acquisition_direction)
            (3.0/4.0)*Math.sqrt(35.0/(2.0*Math::PI))*((acquisition_direction.z*acquisition_direction.y*(3.0*acquisition_direction.x**2 - acquisition_direction.y**2))/acquisition_direction.r**4)
          end

          def self.y_4_m2(acquisition_direction)
            (3.0/4.0)*Math.sqrt(5.0/Math::PI)*((acquisition_direction.x*acquisition_direction.y*(7.0*acquisition_direction.z**2 - acquisition_direction.r**2))/acquisition_direction.r**4)
          end

          def self.y_4_m1(acquisition_direction)
            (3.0/4.0)*Math.sqrt(5.0/(2.0*Math::PI))*((acquisition_direction.z*acquisition_direction.y*(7.0*acquisition_direction.z**2 - 3.0*acquisition_direction.r**2))/acquisition_direction.r**4)
          end

          def self.y_4_0(acquisition_direction)
            (3.0/16.0)*Math.sqrt(1.0/Math::PI)*((35.0*acquisition_direction.z**4 - 30.0*(acquisition_direction.z**2)*(acquisition_direction.r**2) + 3.0*acquisition_direction.r**4)/acquisition_direction.r**4)
          end

          def self.y_4_1(acquisition_direction)
            (3.0/4.0)*Math.sqrt(5.0/(2.0*Math::PI))*((acquisition_direction.z*acquisition_direction.x*(7.0*acquisition_direction.z**2 - 3.0*acquisition_direction.r**2))/acquisition_direction.r**4)
          end

          def self.y_4_2(acquisition_direction)
            (3.0/8.0)*Math.sqrt(5.0/Math::PI)*(((acquisition_direction.x**2 - acquisition_direction.y**2)*(7.0*acquisition_direction.z**2 - acquisition_direction.r**2))/acquisition_direction.r**4)
          end

          def self.y_4_3(acquisition_direction)
            (3.0/4.0)*Math.sqrt(35.0/(2.0*Math::PI))*((acquisition_direction.z*acquisition_direction.x*(acquisition_direction.x**2 - 3.0*acquisition_direction.y**2))/acquisition_direction.r**4)
          end

          def self.y_4_4(acquisition_direction)
            (3.0/4.0)*Math.sqrt(35.0/(2.0*Math::PI))*(((acquisition_direction.x**2)*(acquisition_direction.x**2 - 3.0*acquisition_direction.y**2) - (acquisition_direction.y**2)*(3.0*acquisition_direction.x**2 - acquisition_direction.y**2))/acquisition_direction.r**4)
          end
        end
      end
    end
  end
end