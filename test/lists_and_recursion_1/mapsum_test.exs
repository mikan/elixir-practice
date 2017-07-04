defmodule MyList2Test do
  use ExUnit.Case
  test "0 case" do
    assert MyList2.mapsum([], &(&1 * &1)) == 0
  end
  test "normal case" do
    assert MyList2.mapsum([1, 2, 3], &(&1 * &1)) == 14
  end
end
