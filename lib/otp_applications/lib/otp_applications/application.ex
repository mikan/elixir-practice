defmodule OTPApplications.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    {:ok, _pid} = OTPApplications.Supervisor.start_link(Application.get_env(:otp_applications, :initial_stack))
  end
end
