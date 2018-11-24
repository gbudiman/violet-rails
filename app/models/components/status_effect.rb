module Components
  include Schools::Stance

  module StatusEffect
    mattr_accessor :status_effects do
      Schools::Stance.status_effects
    end  
  end
end