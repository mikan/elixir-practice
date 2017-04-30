defmodule MyEnum do
  def all?(enumerable, fun \\ fn x -> x end), do: filter(enumerable, fun) != []
  def each(enumerable, fun), do: for e <- enumerable, do: fun.(e)
  def filter(enumerable, fun), do: _filter(enumerable, [], fun)
  defp _filter([], filtered, _), do: filtered;
  defp _filter([head | tail], filtered, fun) do
    if fun.(head) do
      _filter(tail, filtered ++ [head], fun)
    else
      _filter(tail, filtered, fun)
    end
  end
end
