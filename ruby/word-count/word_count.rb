# frozen_string_literal: true

class Phrase

  attr_reader :words

  def initialize(phrase)
    @words = phrase.downcase.scan(/\b['\w]+\b/)
  end

  def word_count
    @count ||= words.each.with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end
end
