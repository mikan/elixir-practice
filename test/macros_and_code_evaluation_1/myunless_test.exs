defmodule MacrosAndCodeEvaluation1Test do
  use ExUnit.Case
  require MacrosAndCodeEvaluation1
  test "use myunless" do
    assert MacrosAndCodeEvaluation1.myunless 1==1, do: false, else: true
  end
end
