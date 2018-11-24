class Entity
  include Components::PrimaryAttribute

  def initialize stats: {}
    stats.each do |k, v|
      Components::PrimaryAttribute.attributes[k] = v  
    end
  end
end