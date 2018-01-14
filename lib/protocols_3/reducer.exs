defmodule Protocols3 do
  def each(collection, fun) do
    Enumerable.reduce(
      collection,
      {:cont, []},
      fn (x, acc) ->
        fun.(x)
        {:cont, acc}
      end
    )
    :ok
  end

  def filter(collection, fun) do
    {:done, result} = Enumerable.reduce(
      collection,
      {:cont, []},
      fn (x, acc) ->
        if fun.(x) do
          {:cont, acc ++ [x]}
        else
          {:cont, acc}
        end
      end
    )
    result
  end

  def map(collection, fun) do
    {:done, result} = Enumerable.reduce(collection, {:cont, []}, fn (x, acc) -> {:cont, acc ++ [fun.(x)]} end)
    result
  end
end

list = [1, 2, 3, 4, 5]

:ok = Protocols3.each(list, &(IO.puts &1))
# 1
# 2
# 3
# 4
# 5

IO.inspect Protocols3.filter(list, &(&1 > 3))
# [4, 5]

IO.inspect Protocols3.map(list, &(&1 * 10))
# [10, 20, 30, 40, 50]
