module Components
  module StatusEffect
    mattr_accessor :status_effects do
      OpenStruct.new([
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
      ].map { |k| [k, 0] }.to_h)
    end
  end
end