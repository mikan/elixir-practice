defmodule ControlFlow2 do
  # cond の例
  def fizzbuzz_cond(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      rem(n, 3) == 0 -> "Fizz"
      rem(n, 5) == 0 -> "Buzz"
      true -> n
    end
  end
  # case の例 (ControlFlow1)
  def fizzbuzz_case(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> n
    end
  end
  # パターンマッチの例
  def fizzbuzz_match(n), do: _fizzbuzz_match(n, rem(n, 3), rem(n, 5))
  defp _fizzbuzz_match(_, 0, 0), do: "FizzBuzz"
  defp _fizzbuzz_match(_, 0, _), do: "Fizz"
  defp _fizzbuzz_match(_, _, 0), do: "Buzz"
  defp _fizzbuzz_match(n, _, _), do: n
end

"""
「ガード節を使って、関数を分けたものだ」に相当する実装が見当たらないので、
P124 の fizzbuzz3.ex の例 (パターンマッチ) を指していると解釈。

Q「どれが、問題を最も表現しているだろうか。どれが、最もメンテナンスしやすいだろうか。」
A:
"3" や "5" を複数個所に書かないといけない cond の例はまず除外。
パターンマッチの例はシンプルだが引数が多い。また個々の関数を離れた場所にも書けてしまい、この場合は好ましくない。
case の例が一番凝縮され、メンテナンスしやすい表現のように思える。

Q「これらの選択肢を考慮するよう、注意を喚起する方法を思いつけるだろうか。」
A:
静的解析などを用い、冗長な記述や条件式には警告を出したり、機械的に変換可能なものはより良いほうに変換するよう提案させたりが考えられる。
例えば Java の IDE の中には for 文を拡張 for 文に、拡張 for 文を Stream に変換するよう提案できるものがある。
"""
