FactoryGirl.define do
  factory :model, class: DTITools::Tools::VoxelClassification::Model do
    order 0
    coefficients { FactoryGirl.build(:shs_coefficients) }

    initialize_with { new(order: order, coefficients: coefficients) }
  end
end