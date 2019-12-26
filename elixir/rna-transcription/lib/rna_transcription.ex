defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn char -> change(char) end)
  end

  defp change(char) do
    case char do
      'G' -> 'C'
      'C' -> 'G'
      'T' -> 'A'
      'A' -> 'U'
    end
  end
  # def to_rna('G'), do: 'C'
  # def to_rna('C'), do: 'G'
  # def to_rna('T'), do: 'A'
  # def to_rna('A'), do: 'U'
  # def to_rna([]),  do: []
  # def to_rna([head|tail]) do
  #   to_rna([head]) ++ to_rna(tail)
  # end
end
