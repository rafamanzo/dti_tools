module DTITools
  module Tools
    module VoxelClassification
      class  AcquisitionDirection
        attr_reader :x, :y, :z, :r

        def initialize(attributes={})
          @x = attributes[:x]
          @y = attributes[:y]
          @z = attributes[:z]
          @r = Math.sqrt(self.x**2 + self.y**2 + self.z**2)
        end

        def x
          @x.to_f
        end

        def y
          @y.to_f
        end

        def z
          @z.to_f
        end
      end
    end
  end
end