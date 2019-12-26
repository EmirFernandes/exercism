# frozen_string_literal: true

class Matrix

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def rows
    @rows ||= parse_string
  end

  def columns
    @columns ||= rows.transpose
  end

  private

  def parse_string
    string.lines.map do |line|
      line.split.map(&:to_i)
    end
  end
end
