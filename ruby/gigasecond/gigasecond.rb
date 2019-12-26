# frozen_string_literal: true

module Gigasecond
  GIGASECOND = 1e9

  def self.from(time)
    time + GIGASECOND
  end
end
