FactoryGirl.define do
  factory :shs_coefficients, class: DTITools::Tools::VoxelClassification::SHSeriesCoefficients do
    acquisition_directions { [FactoryGirl.build(:acquisition_direction)] }
    lmax 0
    initialize_with { new(acquisition_directions, lmax) }
  end
end