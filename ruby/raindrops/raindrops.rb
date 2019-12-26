# frozen_string_literal: true

module Raindrops
  def self.convert(number)
    drops = []

    drops << 'Pling' if number.modulo(3).zero?
    drops << 'Plang' if number.modulo(5).zero?
    drops << 'Plong' if number.modulo(7).zero?

    drops.empty? ? number.to_s : drops.join
  end
end
