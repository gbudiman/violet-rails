class Entity
  include Components::PrimaryAttribute
  include Components::StatusEffect
  include Components::EquippedGizmo
  #include Schools::Stance

  def initialize stats: {}, effects: {}, equips: {}
    stats.each { |k, v| primary_attributes[k] = v }
    effects.each { |k, v| status_effects[k] = v }
    equips.each { |eq| compute_gizmo_attributes(eq) }
  end
end