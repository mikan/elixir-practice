# Imported from ListsAndRecursion-8/tax.ex
defmodule LAR8 do
  def tax_ins(rates, orders), do: Enum.map(orders, &(tax_in(&1, rates[&1[:ship_to]])))
  defp tax_in(order, nil), do: order ++ [total_amount: order[:net_amount]]
  defp tax_in(order, rate), do: order ++ [total_amount: order[:net_amount] * (1 + rate)]
end
tax_rates = [ NC: 0.075, TX: 0.08 ]

defmodule MyString7 do
  def tax_from_file(rates, filename), do: LAR8.tax_ins(rates, Enum.map(load(filename), &parse/1))
  defp load(f), do: File.stream!(f) |> Stream.filter_map(&(not String.starts_with?(&1, "id")), &String.trim/1)
  defp parse(line), do: new(String.split(line, ","))
  defp new(data), do: [
    {:id, Enum.at(data, 0)},
    {:ship_to, String.to_atom(Enum.at(data, 1))},
    {:net_amount, Enum.at(data, 2)}]
end

IO.inspect MyString7.tax_from_file(tax_rates, "lib/StringsAndBinaries-7/sales.csv")
# [[id: "123", ship_to: :":NC", net_amount: "100.00", total_amount: "100.00"],
#  [id: "124", ship_to: :":OK", net_amount: "35.50", total_amount: "35.50"],
#  [id: "125", ship_to: :":TX", net_amount: "24.00", total_amount: "24.00"],
#  [id: "126", ship_to: :":TX", net_amount: "44.80", total_amount: "44.80"],
#  [id: "127", ship_to: :":NC", net_amount: "25.00", total_amount: "25.00"],
#  [id: "128", ship_to: :":MA", net_amount: "10.00", total_amount: "10.00"],
#  [id: "129", ship_to: :":CA", net_amount: "102.00", total_amount: "102.00"],
#  [id: "120", ship_to: :":NC", net_amount: "50.00", total_amount: "50.00"]]
