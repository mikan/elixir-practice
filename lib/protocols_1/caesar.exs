defprotocol Caesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do
  def encrypt(string, shift) do
    ListsAndRecursion3.caesar(string, shift)
  end
  def rot13(string) do
    encrypt(string, 13)
  end
end

defimpl Caesar, for: BitString do
  def encrypt(string, shift) do
    to_string(ListsAndRecursion3.caesar(to_charlist(string), shift))

  end
  def rot13(string) do
    encrypt(string, 13)
  end
end

defmodule ListsAndRecursion3 do
  def caesar([], _), do: []
  def caesar([head|tail], y), do: [loop(head, y) | caesar(tail, y)]
  defp loop(x, y), do: rem(((x - 97) + y), 26) + 97
end

IO.puts Caesar.rot13('abc')     # nop
IO.puts Caesar.rot13("abc")    # nop
IO.puts Caesar.encrypt("z", 1) # a
