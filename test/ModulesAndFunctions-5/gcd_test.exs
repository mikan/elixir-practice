defmodule GCDTest do
  use ExUnit.Case
  test "X case" do
    assert GCD.gcd(1, 0) == 1
  end
  test "normal case" do
    assert GCD.gcd(2, 4) == 2
    assert GCD.gcd(10, 5) == 5
    assert GCD.gcd(10, 6) == 2
  end
end