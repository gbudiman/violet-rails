module Components
  module EquippedGizmo
    mattr_reader :gizmo_attributes do
      OpenStruct.new([
        :class_shield,
        :class_one_handed
      ].map { |k| [k, false] }.to_h)
    end

    def compute_gizmo_attributes _eq
      eq = OpenStruct.new(_eq)
      eq.attributes.each do |attribute|
        gizmo_attributes[attribute] = true
      end
    end
  end
end