defmodule Protocols4 do
  defstruct value: 0

  defimpl Inspect do
    def inspect(%Protocols4{value: value}, _opts) do
      "%Protocols4{#{value}=#{as_binary(value)}}}"
    end
    defp as_binary(value) do
      to_string(:io_lib.format("~.2B", [value]))
    end
  end
end

fifty = %Protocols4{value: 50}
IO.inspect fifty
