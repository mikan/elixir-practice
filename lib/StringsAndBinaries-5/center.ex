defmodule MyString5 do
  def center(dqs_list) do
    max = max_length(dqs_list)
    Enum.each(dqs_list, &(IO.puts(add_padding(&1, max))))
  end
  defp add_padding(dqs, max_length), do: String.duplicate(" ", div(max_length - String.length(dqs), 2)) <> dqs
  defp max_length(dqs_list), do: Enum.max(Enum.map(dqs_list, &(String.length(&1))))
end

MyString5.center(["cat", "zabra", "elephant"])
#   cat
#  zabra
# elephant
