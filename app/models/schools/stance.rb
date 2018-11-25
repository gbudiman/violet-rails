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

    @skills = [
      :stance_vigilance,
      :stance_vigilance_keen_eyes,
      :stance_bulwark,
      :stance_bulwark_bladestorm,
      :stance_colossus,
      :stance_colossus_deadlock,
      :stance_aggression,
      :stance_aggression_shield_durability,
      :stance_aggression_quicken,
      :stance_aggression_continuum,
      :stance_recovery,
      :stance_recovery_deft_block,
      :stance_phalanx,
      :stance_phalanx_extension,
      :stance_phalanx_gap,
      :stance_phalanx_polearm,
      :stance_mobility,
      :stance_focus,
    ]

    mattr_accessor :skills do @skills end
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

      case stance
      when :stance_bulwark 
        status_effects[:bulwark_bladestorm] = acquired_skills.stance_bulwark_bladestorm
      end
    end

    @stances.each do |stance|
      define_method(stance) do
        if acquired_skills[stance]
          reset_stance
          apply_stance_effects stance
        end
      end
    end
  end
end