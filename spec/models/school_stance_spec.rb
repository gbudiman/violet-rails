require 'rails_helper'

RSpec.describe 'SchoolStance', type: :model do
  context 'switching stance' do
    before :each do
      @entity = Entity.new(equips: [ { attributes: [ :class_shield ]}])
    end

    it 'should only have only one active stance' do
      @entity.stance_vigilance
      expect(@entity.status_effects.stance_vigilance).to eq true
      
      @entity.stance_aggression
      expect(@entity.status_effects.stance_vigilance).to eq 0
      expect(@entity.status_effects.stance_aggression).to eq true
    end
  end
end
