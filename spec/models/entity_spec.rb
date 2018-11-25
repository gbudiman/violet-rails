# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'should assign primary attributes correctly' do
    entity = Entity.new(stats: { agi: 30, fai: 75 })
    expect(entity.primary_attributes.to_h).to eq(
      str: 1,
      agi: 30,
      vit: 1,
      dex: 1,
      int: 1,
      fai: 75
    )
  end

  it 'should assign status effects correctly' do
    entity = Entity.new(effects: { keen_eyes: 3 })
    expect(entity.status_effects.keen_eyes).to eq 3
  end

  it 'should compute gizmo attributes correctly' do
    entity = Entity.new(equips: [{ attributes: [:class_shield] }])
    expect(entity.gizmo_attributes.class_shield).to eq(true)
  end

  it 'should assing acquired skills correctly' do
    entity = Entity.new(skills: %i[stance_vigilance stance_vigilance_keen_eyes])
    expect(entity.acquired_skills.stance_vigilance).to eq(true)
    expect(entity.acquired_skills.stance_vigilance_keen_eyes).to eq(true)
  end
end
