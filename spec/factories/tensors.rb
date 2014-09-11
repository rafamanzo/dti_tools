FactoryGirl.define do
  factory :tensor, class: DTITools::Tools::VoxelClassification::Tensor do
    dxx 1.0
    dxy 0.0
    dxz 0.0
    dyy 1.0
    dyz 0.0
    dzz 1.0

    initialize_with { new(dxx: dxx, dxy: dxy, dxz: dxz, dyy: dyy, dyz: dyz, dzz: dzz) }
  end
end