# frozen_string_literal: true

module Components
  module EquippedGizmo
    mattr_reader :gizmo_attributes do
      OpenStruct.new(%i[
        shield
        one_handed
      ].map { |k| [k, false] }.to_h)
    end

    def compute_gizmo_attributes(heq)
      eq = OpenStruct.new(heq)
      eq.attributes.each do |attribute|
        gizmo_attributes[attribute] = true
      end
    end

    def equip_reset
      gizmo_attributes.to_h.each do |k, _v|
        gizmo_attributes[k] = false
      end
    end
  end
end
