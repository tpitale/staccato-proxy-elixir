defmodule Staccato.Proxy.Mixfile do
  use Mix.Project

  def project do
    [
      app: :staccato_proxy,
      version: "0.0.1",
      elixir: "~> 1.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      # escript: [
      #   main_module: Staccato.Proxy.CLI,
      #   app: nil
      # ],
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:logger, :httpotion, :socket],
      mod: {Staccato.Proxy, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
      {:httpotion, "~> 2.1.0"},
      # {:socket, github: "meh/elixir-socket", branch: "master"},
      {:socket, "~> 0.3.5"},
      {:distillery, "~> 0.9"}
    ]
  end
end
