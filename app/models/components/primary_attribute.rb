# frozen_string_literal: true

module Components
  module PrimaryAttribute
    mattr_accessor :primary_attributes do
      OpenStruct.new(str: 1, vit: 1, agi: 1, dex: 1, int: 1, fai: 1)
    end

    def primary_attribute_reset
      primary_attributes.to_h.each do |k, _v|
        primary_attributes[k] = 1
      end
    end
  end
end
