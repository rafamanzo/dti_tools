require 'distribution'

module DTITools
  module Tools
    module VoxelClassification
      class Anova
        def initialize(attributes={})
          @model_a = attributes[:model_a]
          @model_b = attributes[:model_b]
          @acquisition_directions = attributes[:acquisition_directions]
          @tensor = attributes[:tensor]
        end

        def equivalent?(significance_level)
          f = ((@acquisition_directions.count - free_parameters(@model_b) -1)*(variance(@model_b) - variance(@model_a)))/((free_parameters(@model_b) - free_parameters(@model_a))*mean_squared_error(@model_b))
          # Freedom degrees
          d1 = @acquisition_directions.count - free_parameters(@model_b) - 1
          d2 = free_parameters(@model_b) - free_parameters(@model_a)

          return f <= Distribution::F.p_value(1.0 - significance_level, d1, d2)
        end

        private

        def variance(model)
          sum = Complex(0, 0)
          m = mean(model)

          @acquisition_directions.each do |acquisition_direction|
            sum += (model.value(acquisition_direction) - m)**2
          end

          return sum/@acquisition_directions.count
        end

        def mean(model)
          sum = Complex(0, 0)

          @acquisition_directions.each do |acquisition_direction|
            sum += model.value(acquisition_direction)
          end

          return sum/@acquisition_directions.count
        end

        def mean_squared_error(model)
          sum = Complex(0, 0)

          @acquisition_directions.each do |acquisition_direction|
            sum += (model.value(acquisition_direction) - @tensor.adc(acquisition_direction))**2
          end

          return sum/@acquisition_directions.count
        end

        def free_parameters(model)
          sum = 0

          (0..model.order).each { |n| sum += (2*n + 1) }

          return sum
        end
      end
    end
  end
end