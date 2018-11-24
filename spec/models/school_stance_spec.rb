require 'rails_helper'

RSpec.describe SchoolStance, type: :model do
  context 'switching stance' do
    before :each do
      @entity = Entity.new(equips: [ { attributes: [ :class_shield ]}])
    end

    
  end
end
