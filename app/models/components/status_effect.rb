module Components
  module StatusEffect
    mattr_accessor :status_effects do
      OpenStruct.new([
        :keen_eyes,
        :bladestorm
      ].map { |k| [k, 0] }.to_h)
    end
  end
end