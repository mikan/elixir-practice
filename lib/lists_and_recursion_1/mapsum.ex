defmodule MyList2 do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)
  def map([], _), do: []
  def map([head|tail], func), do: [func.(head)|map(tail, func)]
  def mapsum(list, func), do: sum(map(list,func))
end

IO.puts MyList2.mapsum [1, 2, 3], &(&1 * &1) # 14
