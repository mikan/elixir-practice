defmodule MyEnumTest do
  use ExUnit.Case
  test "all? normal case" do
    assert MyEnum.all?([1, 2, 3, 4, 5], &(&1 <= 5)) == true
    assert MyEnum.all?([1, 2, 3, 4, 5], &(&1 == 0)) == false
  end
  test "filter normal case" do
    assert MyEnum.filter([1, 2, 3, 4, 5], &(&1 > 3)) == [4, 5]
  end
end
