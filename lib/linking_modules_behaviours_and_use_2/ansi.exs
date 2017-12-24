format = IO.ANSI.format(["Hello, ", :inverse, :bright, "world!"], true)
IO.puts format
# Hello, ?[7m?[1mworld!?[0m
IO.inspect format
# [[[[[[], "Hello, "] | "\e[7m"] | "\e[1m"], "world!"] | "\e[0m"]
