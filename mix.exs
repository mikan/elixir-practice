defmodule ElixirPractice.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_practice,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpotion]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:json, "~> 1.0"},
      {:httpotion, "~> 3.0.2"}, # Replaced from httpoison, See https://elixirforum.com/t/programming-elixir-chapter-13-problem/5793/10
      {:poison, "~> 2.2"},
      {:excoveralls, "~> 0.7", only: :test}
    ]
  end
end
