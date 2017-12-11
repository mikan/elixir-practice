defmodule MacrosAndCodeEvaluation2Extract do
  require MacrosAndCodeEvaluation2
  MacrosAndCodeEvaluation2.times_n(3)
  MacrosAndCodeEvaluation2.times_n(4)
end

defmodule MacrosAndCodeEvaluation2Test do
  use ExUnit.Case
  test "use times_3 and times_4" do
    assert MacrosAndCodeEvaluation2Extract.times_3(4) == 12
    assert MacrosAndCodeEvaluation2Extract.times_4(5) == 20
  end
end
