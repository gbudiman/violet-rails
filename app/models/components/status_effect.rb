module Components
  include Schools::Stance

  module StatusEffect
    mattr_accessor :status_effects do
      h = {}
      ['stance'].each do |school|
        h.merge!(('Schools::' + school.camelize).constantize.effects)
      end

      OpenStruct.new(h)
    end  
  end
end