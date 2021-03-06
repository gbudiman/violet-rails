# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SchoolStance', type: :model do
  before :each do
    @entity
  end

  context 'unmet equipment requirement' do
    it 'should raise error' do
      @entity = Entity.new(
        skills: [:stance_vigilance]
      )

      expect do
        @entity.stance_vigilance
      end.to raise_error(Entity::UnmetRequirement, /has_equipped_shield/)
    end
  end

  context 'unacquired skill' do
    it 'should raise error' do
      @entity = Entity.new(
        equips: [{ attributes: [:shield] }]
      )

      expect do
        @entity.stance_vigilance
      end.to raise_error(Schools::UnacquiredSkill)
    end
  end

  context 'switching stance' do
    before :each do
      @entity = Entity.new(
        equips: [{ attributes: [:shield] }],
        skills: %i[stance_vigilance stance_aggression]
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
      @entity = Entity.new(
        equips: [{ attributes: [:shield] }],
        skills: %i[stance_bulwark stance_bulwark_bladestorm]
      )
    end

    it 'should grant bonus status effect' do
      @entity.stance_bulwark
      expect(@entity.status_effects.stance_bulwark).to eq true
      expect(@entity.status_effects.bulwark_bladestorm).to eq true
    end
  end
end
