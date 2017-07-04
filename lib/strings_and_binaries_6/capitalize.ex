defmodule StringsAndBinaries6 do
  @delim ". "
  def capitalize_sentences(dqs), do: String.split(dqs, @delim) |> Enum.map(&String.capitalize/1) |> Enum.join(@delim)
end

IO.puts StringsAndBinaries6.capitalize_sentences("oh. A DOG. woof. ") # Oh. A dog. Woof.
