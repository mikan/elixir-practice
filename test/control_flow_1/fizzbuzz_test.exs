defmodule ControlFlow1Test do
  use ExUnit.Case
  test "normal case" do
    assert ControlFlow1.upto(1) == [1]
    assert ControlFlow1.upto(20) == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14,
                                         "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"]
  end
end
