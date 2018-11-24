class Entity
  include Components::PrimaryAttribute
  include Components::StatusEffect

  def initialize stats: {}, effects: {}
    stats.each do |k, v|
      primary_attributes[k] = v  
    end

    effects.each do |k, v|
      status_effects[k] = v
    end
  end
end