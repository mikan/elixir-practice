defmodule MyList3Test do
  use ExUnit.Case
  test "positive case" do
    assert MyList3.max([1, 2, 3]) == 3
    assert MyList3.max([1, 2, -3]) == 2
  end
  test "negative case" do
    assert MyList3.max([-1, -2, -3]) == -1
  end
end
