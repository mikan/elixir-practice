defmodule CSVSigil do
  def sigil_v(csv, _opts) do
    csv |> String.trim_trailing |> String.split("\n") |> Enum.map(&(String.split(&1, ",")))
  end
end

defmodule MoreCoolStuff1 do
  import CSVSigil

  def csv do
    csv = ~v"""
    1,2,3
    cat,dog
    """
    csv
  end
end

IO.inspect MoreCoolStuff1.csv
# [["1", "2", "3"], ["cat", "dog"]]
