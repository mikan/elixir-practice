defmodule ControlFlow1 do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} ->
        "FizzBuzz"
      {0, _} ->
        "Fizz"
      {_, 0} ->
        "Buzz"
      {_, _} ->
        n
    end
  end
end

IO.inspect ControlFlow1.upto(20)
# [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14,
#  "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"]
