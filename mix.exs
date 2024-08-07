defmodule PhoenixLiveViewBarcodeScanner.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_liveview_barcode_scanner,
      version: "0.4.0",
      elixir: "~> 1.16",
      start_permanent: false, # Mix.env() == :prod,
      build_embedded: false, # Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Phoenix LiveView Barcode Scanner",
      source_url: github_url(),
    ]
  end

  def application do
    [
    ]
  end

  defp deps do
    [
      {:phoenix, ">= 1.7.12"},
      {:phoenix_live_view, ">= 0.20.2"},

      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp description() do
    "Capture USB barcode scanner HID input in Phoenix LiveView"
  end

  defp package() do
    [
      files: ~w(lib test mix.* README* LICENSE* .formatter.exs),
      licenses: ["MIT"],
      links: %{"GitHub" => github_url()},
    ]
  end

  defp github_url() do
    "https://github.com/bchase/phoenix_liveview_barcode_scanner"
  end
end
