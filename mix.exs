defmodule Phoenix.LiveView.BarcodeScanner.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_liveview_barcode_scanner,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: false, # Mix.env() == :prod,
      deps: deps(),
    ]
  end

  def application do
    [
      extra_applications: [:logger],
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7.2"},
      {:phoenix_live_view, "~> 0.18.16"},
    ]
  end
end
