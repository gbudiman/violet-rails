require 'rails_helper'

RSpec.describe 'SchoolStance', type: :model do
  context 'switching stance' do
    before :each do
      @entity = Entity.new(
        equips: [ { attributes: [ :class_shield ]}],
        skills: [ :stance_vigilance, :stance_aggression ]
      )
    end

    it 'should only have only one active stance' do
      @entity.stance_vigilance
      expect(@entity.status_effects.stance_vigilance).to eq true

      @entity.stance_aggression
      expect(@entity.status_effects.stance_vigilance).to eq 0
      expect(@entity.status_effects.stance_aggression).to eq true
      expect(@entity.status_effects.aggression_shield_durability).to eq 0
    end
  end

  context 'advanced stance' do
    before :each do
      @entity = Entity.new(skills: [ :stance_bulwark, :stance_bulwark_bladestorm ])
    end

    it 'should grant bonus status effect' do
      @entity.stance_bulwark
      expect(@entity.status_effects.stance_bulwark).to eq true
      expect(@entity.status_effects.bulwark_bladestorm).to eq true
    end
  end
end
