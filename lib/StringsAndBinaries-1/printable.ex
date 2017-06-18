defmodule MyString1 do
  def printable?([]), do: true
  def printable?(enumerable), do: Enum.all?(enumerable, &(_printable? &1))
  defp _printable?(c) when c >= ?\s and c <= ?~, do: true
  defp _printable?(_), do: false
end

# true
IO.puts MyString1.printable? ''
IO.puts MyString1.printable? 'a'
IO.puts MyString1.printable? 'b'
IO.puts MyString1.printable? 'ab'

# false
IO.puts MyString1.printable? '\a'
IO.puts MyString1.printable? '\d'
IO.puts MyString1.printable? 'あ'
IO.puts MyString1.printable? 'aあ'
