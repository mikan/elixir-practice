IO.inspect [ 'cat' | 'dog' ]                    # ['cat', 100, 111, 103]
IO.inspect [ 'cat' | 'dog' ], charlists: []     # [[99, 97, 116], 100, 111, 103]
# Elements in the list:
# 1. character list (printable)
# 2. number (not printable)
# 3. number (not printable)
# 4. number (not printable)

IO.inspect [ 'cat' | [ 'dog' ] ]                # ['cat', 'dog']
IO.inspect [ 'cat' | [ 'dog' ] ], charlists: [] # [[99, 97, 116], [100, 111, 103]]
# Elements in the list:
# 1. character list (printable)
# 2. character list (printable)

# NOTE: Inspect.Ops https://hexdocs.pm/elixir/Inspect.Opts.html
