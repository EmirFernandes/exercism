defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(s1, s2) when length(s1) == length(s2) do
    {
      :ok,
      Enum.zip(s1, s2) |> Enum.count(fn {a, b} -> a != b end)
    }
  end
  def hamming_distance(_, _), do: {:error, "Lists must be the same length"}
end
