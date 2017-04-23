defmodule MyList5 do
  def span(from, to) when to < from, do: []
  def span(from, to), do: [from | span(from + 1, to)]
end
