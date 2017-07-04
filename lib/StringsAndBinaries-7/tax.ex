defmodule ListsAndRecursion8 do
  def tax_ins(orders, rates), do: orders |> Enum.map(&tax_in(&1, rates[&1[:ship_to]]))
  defp tax_in(order, nil), do: order ++ [total_amount: order[:net_amount]]
  defp tax_in(order, rate), do: order ++ [total_amount: order[:net_amount] * (1 + rate)]
end
tax_rates = [ NC: 0.075, TX: 0.08 ]

defmodule StringsAndBinaries7 do
  def tax_from_file(rates, filename), do: load(filename) |> Enum.map(&parse/1) |> ListsAndRecursion8.tax_ins(rates)
  defp load(f), do: File.stream!(f) |> Stream.filter_map(&(not String.starts_with?(&1, "id")), &String.trim/1)
  defp parse(line), do: String.split(line, ",") |> new
  defp new(data), do: [
    {:id, Enum.at(data, 0) |> String.to_integer},
    {:ship_to, Enum.at(data, 1) |> String.slice(1, 2) |> String.to_atom},
    {:net_amount, Enum.at(data, 2) |> String.to_float}]
end

IO.inspect StringsAndBinaries7.tax_from_file(tax_rates, "lib/StringsAndBinaries-7/sales.csv")
# [[id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
#  [id: 124, ship_to: :OK, net_amount: 35.5, total_amount: 35.5],
#  [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
#  [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
#  [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
#  [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
#  [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
#  [id: 120, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]]
