class Entity
  include Components::PrimaryAttribute

  def initialize stats: {}
    stats.each do |k, v|
      primary_attributes[k] = v  
    end
  end
end