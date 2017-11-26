defmodule OTPApplications3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, initial_number) do
    {:ok, _pid} = OTPApplications3.Supervisor.start_link(initial_number)
  end
end
