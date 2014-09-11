FactoryGirl.define do
  factory :acquisition_direction, class: DTITools::Tools::VoxelClassification::AcquisitionDirection do
    x 1.0
    y 0.0
    z 0.0

    initialize_with { new(x: x, y: y, z: z) }
  end
end