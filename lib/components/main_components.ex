defmodule Monsum.MainComponents do
  @moduledoc """
  uses tailwindcss and daisyui

  expects the following global classes:
  see assets/css/monsum.css
  """
  use Phoenix.Component

  @doc """
  Renders a button with navigation support.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" class="btn-primary">Send!</.button>
      <.button navigate={~p"/"}>Home</.button>
  """
  attr :rest, :global, include: ~w(href navigate patch)
  attr :class, :string, default: "btn-primary"
  slot :inner_block, required: true

  def button(%{rest: rest} = assigns) do
    if rest[:href] || rest[:navigate] || rest[:patch] do
      ~H"""
      <.link class={["btn btn-monsum", @class]} {@rest}>
        {render_slot(@inner_block)}
      </.link>
      """
    else
      ~H"""
      <button class={["btn btn-monsum", @class]} {@rest}>
        {render_slot(@inner_block)}
      </button>
      """
    end
  end

  @doc """
  Renders child containers in col wiht a gap

  ## Examples

      <.flexbox_col>
        <div>row 1</div>
        <div>row 2</div>
        <div>row 3</div>
      </.flexbox_col>
  """

  slot :inner_block, required: true
  attr :class, :string, default: ""

  def flexbox_col(assigns) do
    ~H"""
    <div class={["flex flex-col gap-y-4", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders containers in grid

  ## Examples

      <.box_grid cols="4">
        <:box>
          <div>One</div>
        </:box>
        <:box>
          <div>Two</div>
        </:box>
        <:box>
          <div>Three</div>
        </:box>
        <:box>
          <div>Four</div>
        </:box>
      </.box_grid>
  """

  attr :class, :string, default: ""
  attr :cols, :string, default: "2"
  slot :box

  def box_grid(assigns) do
    col_classes = %{
      "2" => "lg:grid-cols-2",
      "3" => "lg:grid-cols-3",
      "4" => "lg:grid-cols-4 md:grid-cols-2",
      "6" => "lg:grid-cols-6 md:grid-cols-3 sm:grid-cols-2",
      "8" => "lg:grid-cols-8 md:grid-cols-4 sm:grid-cols-2"
    }

    assigns = assign(assigns, col_class: col_classes[assigns.cols])

    ~H"""
    <div class={["grid grid-flow gap-2", @col_class, @class]}>
      <div :for={box <- @box}>
        {render_slot(box)}
      </div>
    </div>
    """
  end
end
