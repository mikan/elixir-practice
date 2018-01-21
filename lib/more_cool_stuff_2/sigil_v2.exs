defmodule CSVSigil2 do
  def sigil_v(csv, _opts) do
    csv
    |> String.trim_trailing
    |> String.split("\n")
    |> Enum.map(&(mapper(String.split(&1, ","))))
  end

  defp mapper(v) do
    v |> Enum.map(&(parse(&1)))
  end

  defp parse(v) do
    case Float.parse(v) do
      {n, _v} -> n
      _ -> v
    end
  end
end

defmodule MoreCoolStuff2 do
  import CSVSigil2

  def csv do
    csv = ~v"""
    1,2,3.14
    cat,dog
    """
    csv
  end
end

IO.inspect MoreCoolStuff2.csv
# [[1.0, 2.0, 3.14], ["cat", "dog"]]
