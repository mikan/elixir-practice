defmodule OTPApplications.ApplicationTest do
  use ExUnit.Case
  doctest OTPApplications.Application

  test "start test" do
    OTPApplications.Application.start(1, [])
    OTPApplications.Server.push(1)
    assert OTPApplications.Server.pop() == 1
  end
end
