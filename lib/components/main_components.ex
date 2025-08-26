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
end
