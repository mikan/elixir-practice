defmodule MyList4 do
  def caesar([], _), do: []
  def caesar([head|tail], y), do: [loop(head, y) | caesar(tail, y)]
  defp loop(x, y), do: rem(((x - 97) + y), 26) + 97
end

IO.puts MyList4.caesar 'abcde', 13 # nopqr
IO.puts MyList4.caesar 'z', 1 # a
IO.puts MyList4.caesar 'b', -1 # a
