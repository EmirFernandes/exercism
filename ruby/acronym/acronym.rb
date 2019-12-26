# frozen_string_literal: true

module Acronym
  def self.abbreviate(string)
    string.scan(/\b\w/).join.upcase
  end
end
