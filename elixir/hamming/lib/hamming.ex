defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(s1, s2) when length(s1) != length(s2) do
    {:error, "Lists must be the same length"}
  end
  def hamming_distance(s1, s2) do
    {:ok, distance(s1, s2) }
  end

  defp distance([], []), do: 0
  defp distance([h1|t1], [h2|t2]) do
    diff = if (h1 == h2), do: 0, else: 1

    diff + distance(t1, t2)
  end
end
