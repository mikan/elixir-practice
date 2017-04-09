defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end
IO.puts Times.quadruple(0) # 0
IO.puts Times.quadruple(1) # 4
IO.puts Times.quadruple(2) # 8
