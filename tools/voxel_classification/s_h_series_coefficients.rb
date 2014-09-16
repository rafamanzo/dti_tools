require 'matrix'

module DTITools
  module Tools
    module VoxelClassification
      class  SHSeriesCoefficients
        def initialize(acquisition_directions, lmax)
          @m = m(acquisition_directions, lmax)
        end

        def coefficients(adcs)
          f = Matrix[adcs].transpose

          @m*f
        end

        private

        def m(acquisition_directions, lmax)
          x = x(acquisition_directions, lmax)
          x_conj_trans = x.conjugate.transpose

          (x_conj_trans*x).inverse*x_conj_trans
        end

        def x(acquisition_directions, lmax)
          rows = []

          acquisition_directions.each do |acquisition_direction|
            row = []
            (0..lmax).each do |l|
              (-l..l).each do |m|
                row << SphericalHarmonics.y(l, m, acquisition_direction)
              end
            end

            rows << row
          end

          Matrix[*rows]
        end
      end
    end
  end
end