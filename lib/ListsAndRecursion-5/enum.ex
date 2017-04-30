defmodule MyEnum do
  def filter(enumerable, fun), do: _filter(enumerable, [], fun)
  defp _filter([], filtered, fun), do: filtered;
  defp _filter([head | tail], filtered, fun) do
    if fun.(head) do
      _filter(tail, filtered ++ [head], fun)
    else
      _filter(tail, filtered, fun)
    end
  end
end

IO.inspect MyEnum.filter [1,2,3,4,5], &(&1 > 3) # [4, 5]
