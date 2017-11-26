defmodule OTPApplications3.Mixfile do
  use Mix.Project

  def project do
    [
      app: :otp_applications_3,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {OTPApplications3.Application, 123},
      registered: [OTPApplications3.Server]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:exrm, "~> 1.0.0-rc7"}
    ]
  end
end
