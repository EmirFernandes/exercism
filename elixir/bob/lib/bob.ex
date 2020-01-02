defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/^[[:cntrl:][:blank:]]*$/u, input) ->
        "Fine. Be that way!"

      Regex.match?(~r/^[^a-z]*[[:upper:]][^a-z]*\?\s*$/u, input) ->
        "Calm down, I know what I'm doing!"

      Regex.match?(~r/(^[^a-z]*[[:upper:]][^a-z]*$)/u, input) ->
        "Whoa, chill out!"

      Regex.match?(~r/^.*\?\s*$/u, input) ->
        "Sure."

      true -> "Whatever."
    end
  end
end
