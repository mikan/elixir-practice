IO.puts "1) float to string"
IO.puts :io.format("~.2f", [3.14]) # 3.14:ok

IO.puts "2) get env vars"
IO.puts System.get_env "JAVA_HOME" # "C:\\Program Files\\Java\\jdk1.8.0_121"

IO.puts "3) get file extension"
IO.puts Path.extname "dave/test.exs" # ".exs"

IO.puts "4) get cwd"
IO.puts System.cwd # "d:/Projects/git/aosn/elixir"

IO.puts "5) convert JSON to elixir data structure"
# json_input = "{\"key\":\"this will be a value\"}"
# {status, list} = JSON.decode(json_input)
# list["key"]

IO.puts "6) execute shell command"
IO.inspect System.cmd "pwd", [] # {"D:\\Projects\\git\\aosn\\elixir\r\n", 0}
