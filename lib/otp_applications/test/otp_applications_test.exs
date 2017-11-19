defmodule OTPApplicationsTest do
  use ExUnit.Case
  doctest OTPApplications

  test "greets the world" do
    assert OTPApplications.hello() == :world
  end
end
