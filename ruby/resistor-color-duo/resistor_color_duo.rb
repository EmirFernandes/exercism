# frozen_string_literal: true

require_relative 'resistor_color'

module ResistorColorDuo

  def self.value(colors)
    value_0 = ResistorColor.color_code(colors[0])
    value_1 = ResistorColor.color_code(colors[1])

    value_0*10 + value_1
  end

end
