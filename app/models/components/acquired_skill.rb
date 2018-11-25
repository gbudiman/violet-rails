module Components
  module AcquiredSkill
    include Schools::Stance

    mattr_accessor :acquired_skills do
      h = {}
      ['stance'].map do |school|
        ('Schools::' + school.camelize).constantize.skills
      end.flatten.each { |x| h[x] = false }

      OpenStruct.new(h)
    end
  end
end