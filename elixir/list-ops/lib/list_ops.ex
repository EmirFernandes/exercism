defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]),  do: 0
  def count(list) do
    list |> reduce(0, fn (_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(list) do
    list |> reduce([], &[&1 | &2])
  end

  @spec map(list, (any -> any)) :: list
  def map(list, func) do
    list
    |> reduce([], &([func.(&1) | &2]))
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], func),  do: []
  def filter(list, func) do
    list
    |> reduce([], &(if func.(&1), do: [&1 | &2], else: &2))
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, f),    do: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append([], []),        do: []
  def append(list_a, []),    do: list_a
  def append([], list_b),    do: list_b
  def append(list_a, list_b) do
    list_a
    |> reverse
    |> reduce(list_b, &[&1 | &2])
  end

  @spec concat([[any]]) :: [any]
  def concat(list) do
    list
    |> reverse
    |> reduce([], &append/2)
  end
end
