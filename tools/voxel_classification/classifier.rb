module DTITools
  module Tools
    module VoxelClassification
      class Classifier
        def initialize(attributes={})
          @significance_level = attributes[:significance_level]
          @acquisition_directions = attributes[:acquisition_directions]
        end

        def classify(tensor)
          max_order = lmax
          adcs = apparent_diffusion_coefficients(tensor)

          selected_model = Model.new(order: 0,
                                     coefficients: SHSeriesCoefficients.new(@acquisition_directions, 0).coefficients(adcs))

          if max_order >= 2
            (2..max_order).each do |order|
              if order % 2 == 0
                new_model = Model.new(order: order,
                                      coefficients: SHSeriesCoefficients.new(@acquisition_directions, order).coefficients(adcs))

                selected_model = new_model unless Anova.new(model_a: selected_model, model_b: new_model, acquisition_directions: @acquisition_directions, tensor: tensor).equivalent?(@significance_level)
              end
            end
          end

          return selected_model.order
        end

        private

        def lmax
          max = 0
          accum = 1 # 2*0 + 1

          while accum < @acquisition_directions.count
            accum += 2*(max + 1) + 1
            accum += 2*(max + 2) + 1

            if accum < @acquisition_directions.count
              max += 2
            end
          end

          return max
        end

        def apparent_diffusion_coefficients(tensor)
          @acquisition_directions.map{ |acquisition_direction| tensor.adc(acquisition_direction) }
        end
      end
    end
  end
end