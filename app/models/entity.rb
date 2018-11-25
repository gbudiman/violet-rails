class Entity
  include Components::PrimaryAttribute
  include Components::StatusEffect
  include Components::EquippedGizmo
  include Components::AcquiredSkill
  include Schools::Stance

  def initialize stats: {}, effects: {}, equips: {}, skills: {}
    stats.each { |k, v| primary_attributes[k] = v }
    effects.each { |k, v| status_effects[k] = v }
    equips.each { |eq| compute_gizmo_attributes(eq) }
    skills.each { |sk| acquired_skills[sk] = true}
  end
end