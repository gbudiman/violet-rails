# frozen_string_literal: true

module Components
  module AcquiredSkill
    include Schools::Stance

    mattr_accessor :acquired_skills do
      h = {}
      y = ['stance'].map do |school|
        ('Schools::' + school.camelize).constantize.skills
      end

      y.flatten.each { |x| h[x] = false }

      OpenStruct.new(h)
    end

    def skill_reset
      acquired_skills.to_h.each do |k, _v|
        acquired_skills[k] = false
      end
    end
  end
end
