defmodule StringsAndBinaries1 do
  def printable?([]), do: true
  def printable?(enumerable), do: Enum.all?(enumerable, &_printable?(&1))
  defp _printable?(c) when c >= ?\s and c <= ?~, do: true
  defp _printable?(_), do: false
end

# true
IO.puts StringsAndBinaries1.printable? ''
IO.puts StringsAndBinaries1.printable? 'a'
IO.puts StringsAndBinaries1.printable? 'b'
IO.puts StringsAndBinaries1.printable? 'ab'

# false
IO.puts StringsAndBinaries1.printable? '\a'
IO.puts StringsAndBinaries1.printable? '\d'
IO.puts StringsAndBinaries1.printable? 'あ'
IO.puts StringsAndBinaries1.printable? 'aあ'
