# frozen_string_literal: true

class Series

  attr_reader :chars

  def initialize(string)
    @chars = string.chars
  end

  def slices(n)
    raise ArgumentError if n > chars.size

    chars.each_cons(n).map(&:join)
  end
end
