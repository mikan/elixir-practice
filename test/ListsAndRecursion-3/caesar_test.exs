defmodule MyList4Test do
  use ExUnit.Case
  test "normal case" do
    assert MyList4.caesar('abcde', 13) == 'nopqr'
    assert MyList4.caesar('z', 1) == 'a'
    assert MyList4.caesar('b', -1) == 'a'
  end
end
