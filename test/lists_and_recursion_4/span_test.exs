defmodule MyList5Test do
  use ExUnit.Case
  test "normal case" do
    assert MyList5.span(1, 10) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert MyList5.span(-1, 1) == [-1, 0, 1]
    assert MyList5.span(10, 1) == []
  end
  test "illegal case" do
    assert MyList5.span(10, 1) == []
  end
end
