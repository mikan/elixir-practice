defmodule Chop do
  def guess(actual, a..b), do: guess(actual, a..b, b)
  defp guess(actual, _, current) when current == actual, do: IO.puts actual
  defp guess(actual, a.._, current) when current > actual do
    next = div(current + a, 2)
    IO.puts "Is it #{next}"
    guess(actual, a..current, next)
  end
  defp guess(actual, _..b, current) when current < actual do
    next = div(b + current, 2)
    IO.puts "Is it #{next}"
    guess(actual, current..b, next)
  end
end
IO.puts Chop.guess(273, 1..1000)
# Is it 500
# Is it 250
# Is it 375
# Is it 312
# Is it 281
# Is it 265
# Is it 273
# 273
# ok