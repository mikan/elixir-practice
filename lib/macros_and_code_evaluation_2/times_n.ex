defmodule MacrosAndCodeEvaluation2 do
  defmacro times_n(n) do
    quote do
      def unquote(String.to_atom("times_#{n}"))(v), do: unquote(n) * v
    end
  end
end
