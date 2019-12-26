module Hamming
  def self.compute(dna, mutation)
    raise ArgumentError if dna.size != mutation.size

    (0...dna.size).count do |index|
      dna[index] != mutation[index]
    end
  end
end
