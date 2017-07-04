prefix = fn name -> fn
  name2 -> name <> " " <> name2
end end
mrs = prefix.("Mrs")
IO.puts(mrs.("Smith")) # Mrs Smith
IO.puts(prefix.("Elixir").("Rocks")) # Elixir Rocks
