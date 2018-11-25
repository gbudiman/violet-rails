module Components
  module StatusEffect
    include Schools::Stance

    mattr_accessor :status_effects do
      h = {}
      ['stance'].each do |school|
        h.merge!(('Schools::' + school.camelize).constantize.effects)
      end

      OpenStruct.new(h)
    end 

    def status_effect_reset
      status_effects.to_h.each do |k, v|
        status_effects[k] = 0
      end
    end
  end
end