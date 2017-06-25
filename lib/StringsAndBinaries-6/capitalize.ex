defmodule MyString6 do
  @delim ". "
  def capitalize_sentences(dqs), do: Enum.map(String.split(dqs, @delim), &String.capitalize(&1)) |> Enum.join(@delim)
end

IO.puts MyString6.capitalize_sentences("oh. A DOG. woof. ") # Oh. A dog. Woof.
