defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([]), do: []
  def to_rna([head|tail]) do
    [translate(head) | to_rna(tail)]
  end

  defp translate(?G), do: ?C
  defp translate(?C), do: ?G
  defp translate(?T), do: ?A
  defp translate(?A), do: ?U
end
