class Entity
  include Components::PrimaryAttribute
  include Components::StatusEffect
  include Components::EquippedGizmo
  include Components::AcquiredSkill
  include Schools::Stance

  def initialize stats: {}, effects: {}, equips: {}, skills: {}
    reset_all

    stats.each { |k, v| primary_attributes[k] = v }
    effects.each { |k, v| status_effects[k] = v }
    equips.each { |eq| compute_gizmo_attributes(eq) }
    skills.each { |sk| acquired_skills[sk] = true}
  end

  def method_missing(method_name, *args)
    spliced = method_name.to_s.split(/_/)

    case method_name.to_s
    when /has_equipped/
      gizmo_attributes[spliced[2..-1].join('_')]
    end
  end

  def fulfill_requirements(reqs)
    unmet_requirements = []
    reqs.each { |req| unmet_requirements.push(req) unless send(req) }
    raise UnmetRequirement, unmet_requirements if unmet_requirements.length > 0

    true
  end

  def reset_all
    primary_attribute_reset
    skill_reset
    status_effect_reset
    equip_reset
  end

  class UnmetRequirement < StandardError
  end
end