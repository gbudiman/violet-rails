module Schools
  module Stance
    @stances = [
      :stance_vigilance,
      :stance_bulwark,
      :stance_colossus,
      :stance_aggression,
      :stance_recovery,
      :stance_phalanx,
      :stance_mobility,
      :stance_focus,
    ]

    @effects = [
      :keen_eyes,
      :bulwark_bladestorm,
      :colossus_deadlock,
      :aggression_shield_durability,
      :aggression_shield_quicken,
      :aggression_continuum,
      :aggression_deft_block,
      :phalanx_extension,
      :phalanx_gap,
      :phalanx_polearm,
    ]

    mattr_accessor :stances do @stances end
    mattr_accessor :effects do
      (@stances + @effects).map { |k| [k, 0] }.to_h
    end

    def reset_stance
      stances.each do |stance|
        status_effects[stance] = 0
      end
    end

    def apply_stance_effects stance
      status_effects[stance] = true
    end

    @stances.each do |stance|
      define_method(stance) do
        reset_stance
        apply_stance_effects stance
      end
    end
  end
end