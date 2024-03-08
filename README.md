# Phoenix LiveView Barcode Scanner

## Capture USB barcode scanner HID input in Phoenix LiveView

A `Phoenix.LiveView.BarcodeScanner` live component is provided, which will render a hidden form that holds input focus as long as it's being rendered.

Scanned barcodes are then sent to the parent component via `handle_info/2`.

## Installation

```elixir
    {:phoenix_liveview_barcode_scanner, "~> 0.1.0"},
```
```elixir
def deps do
  [
    # ...
    {:phoenix_liveview_barcode_scanner, "~> 0.1.0"},
    # ...
  ]
end
```

## Usage

```elixir
defmodule AppWeb.SomePage do
  use Phoenix.LiveView

  alias PhoenixLiveViewBarcodeScanner.BarcodeScanner

  # ...

  def render(assigns) do
    ~H"""
    <div>
      <.live_component module={BarcodeScanner} id="barcode-scanner">
        <p>
          <%= @barcode %>
        </p>
      </.live_component>
    </div>
    """
  end

  def handle_info({BarcodeScanner, :barcode_scanned, %{barcode: barcode}}, socket) do
    {:noreply, socket |> assign(barcode: barcode)}
  end
end
```
