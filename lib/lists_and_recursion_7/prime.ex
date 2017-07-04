defmodule Span do
  # same as lists_and_recursion_4
  def span(from, to) when to < from, do: []
  def span(from, to), do: [from | span(from + 1, to)]
end

defmodule Prime do
  def prime(n), do: for i <- Span.span(2, n), prime?(i), do: i
  defp remzero(n), do: for i <- Span.span(1, n), rem(n, i) == 0, do: i
  defp prime?(n), do: Enum.count(remzero(n)) == 2
end

IO.inspect Prime.prime(20) # [2, 3, 5, 7, 11, 13, 17, 19]
