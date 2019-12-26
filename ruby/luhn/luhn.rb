# frozen_string_literal: true

module Luhn
  DOUBLES = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9].freeze

  def self.valid?(string)
    string = string.delete("\s")

    return false unless string.match?(/^([[:digit:]]){2,}$/)

    numbers = string.scan(/[[:digit:]]/).map(&:to_i)

    luhn(numbers).modulo(10).zero?
  end

  def self.luhn(numbers)
    numbers.reverse.each_slice(2).sum do |even, odd = 0|
      even + DOUBLES[odd]
    end
  end
end
