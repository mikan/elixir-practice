defmodule MyEnumTest do
  use ExUnit.Case
  test "normal case" do
    assert MyEnum.filter([1, 2, 3, 4, 5], &(&1 > 3)) == [4, 5]
  end
end
