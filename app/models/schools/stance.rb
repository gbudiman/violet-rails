module Schools
  module Stance
    @stances = [
      :stance_vigilance,
      :stance_vigilance_keen_eyes,
      :stance_bulwark,
      :stance_bulwark_bladestorm,
      :stance_colossus,
      :stance_colossus_deadlock,
      :stance_aggression,
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

    mattr_accessor :stances do @stances end
    mattr_accessor :status_effects do
      OpenStruct.new(@stances.map { |k| [k, 0] }.to_h)
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