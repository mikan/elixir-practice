defmodule ControlFlow3Test do
  use ExUnit.Case
  test "true case" do
    assert ControlFlow3.ok!({:ok, "True Case"}) == "True Case"
  end
  test "false case" do
    assert_raise RuntimeError, fn -> ControlFlow3.ok!({:ng, "False Case"}) end
  end
end
