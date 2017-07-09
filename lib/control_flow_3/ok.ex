defmodule ControlFlow3 do
  def ok!({atom, data}) do
    case atom == :ok do
      true -> data
      false -> raise "atom: #{atom}, data: #{data}"
    end
  end
end

# True case
file = ControlFlow3.ok! File.open("README.md")
File.close(file)

# False calse
#_ = ControlFlow3.ok! File.open("README2.md")
# ** (RuntimeError) atom: error, data: enoent
#    lib/control_flow_3/ok.ex:5: ControlFlow3.ok!/1
#    (elixir) lib/code.ex:370: Code.require_file/2
