defmodule MyListTest do
  use ExUnit.Case
  test "0 case" do
    assert MyList.sum([]) == 0
  end
  test "normal case" do
    assert MyList.sum([1, 2]) == 3
  end
end
