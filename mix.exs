defmodule MySystem.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_system,
      name: "My System Demo",
      source_url: "https://lego.com",
      homepage_url: "https://lego.com",
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MySystem.Application, []}
    ]
  end

  defp aliases do
    [
      release: [
        "compile",
        "release --overwrite"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.34", only: :dev, runtime: false, warn_if_outdated: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      # The main page in the docs
      main: "MySystem",
      extras: ["README.md"]
    ]
  end
end
