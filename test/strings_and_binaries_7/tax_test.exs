defmodule StringsAndBinaries7Test do
  use ExUnit.Case
  test "file input case" do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    res = StringsAndBinaries7.tax_from_file(tax_rates, "lib/strings_and_binaries_7/sales.csv")
    record = Enum.at(res, 0)
    assert record[:id] == 123
    assert record[:ship_to] == :NC
    assert record[:net_amount] == 100.0
    assert record[:total_amount] == 107.5
  end
end
