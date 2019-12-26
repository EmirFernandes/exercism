# frozen_string_literal: true

module Isogram
  def self.isogram?(input)
    chars = input.gsub(/\W/, '').downcase.chars

    chars.size == chars.uniq.size
  end
end
