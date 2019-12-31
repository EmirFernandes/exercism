defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase()
      |> String.split(~r/[^\w-]|_/u)
      |> Enum.reject(&blank?/1)
      |> Enum.reduce(%{}, &word_counter/2)
  end

  defp blank?(""),   do: true
  defp blank?(word), do: false

  defp word_counter(word, counter) do
    Map.update(counter, word, 1, &(&1 + 1))
  end
end
