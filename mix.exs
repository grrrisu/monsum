defmodule Monsum.MixProject do
  use Mix.Project

  def project do
    [
      app: :monsum,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Important for asset compilation
      compilers: Mix.compilers(),
      # Include priv directory in package
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.8.0-rc.3"},
      {:phoenix_live_view, "~> 1.1.0-rc.1"},
      {:phoenix_html, "~> 4.0"},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "priv", "assets", "mix.exs", "README.md"],
      maintainers: ["Alessandro Di Maria"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/grrrisu/monsum"}
    ]
  end
end
