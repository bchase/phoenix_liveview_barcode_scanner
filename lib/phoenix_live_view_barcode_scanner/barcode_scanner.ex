defmodule PhoenixLiveViewBarcodeScanner.BarcodeScanner do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.JS

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%= render_slot(@inner_block, []) %>

      <div style="width: 0; overflow: hidden">
        <.form
          :let={_f}
          for={Phoenix.Component.to_form(%{})}
          as={nil}
          id={@id}
          phx-target={@myself}
          phx-submit="barcode_submit"
        >
          <input
            type="text"
            name="barcode"
            id={barcode_input_id(@id_count)}
            autocomplete="off"
            inputmode="none"
            value={nil}
            errors={[]}
            phx-target={@myself}
            phx-mounted={JS.focus(to: "##{barcode_input_id(@id_count)}")}
            phx-blur={JS.focus(to: "##{barcode_input_id(@id_count)}")}
          />
        </.form>
      </div>
    </div>
    """
  end

  defp barcode_input_id(count), do: "bcs-barcode-input-#{count}"


  @impl true
  def update(%{id: id} = assigns, socket) do
    socket =
      socket
      |> assign(%{
        id: id,
        inner_block: assigns[:inner_block],

        id_count: 0,
      })

    {:ok, socket}
  end


  @impl true
  def handle_event("barcode_submit", %{"barcode" => barcode}, socket) do
    notify_parent_barcode_scanned(barcode)

    socket =
      socket
      |> assign(%{
        id_count: socket.assigns.id_count + 1,
      })

    {:noreply, socket}
  end


  defp notify_parent_barcode_scanned(barcode) do
    send(self(), {__MODULE__, :barcode_scanned, %{barcode: barcode}})
  end
end
