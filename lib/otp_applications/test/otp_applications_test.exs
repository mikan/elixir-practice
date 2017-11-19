defmodule OtpApplicationsTest do
  use ExUnit.Case
  doctest OtpApplications

  test "greets the world" do
    assert OtpApplications.hello() == :world
  end
end
