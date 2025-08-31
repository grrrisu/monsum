defmodule Monsum.Buttons do
  @moduledoc """
  uses tailwindcss and daisyui

  expects the following global classes:
  see assets/css/monsum.css
  """
  use Phoenix.Component

  import Monsum.MainComponents

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

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def action_box(assigns) do
    ~H"""
    <div class={["rounded-md border border-sky-500 py-2 px-4 bg-sky-950", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :running, :boolean, required: true

  def start_button(%{running: false} = assigns) do
    ~H"""
    <.button id="start-button" phx-click="start" phx-disable-with="Starting...">
      <.icon name="hero-play" />&nbsp;Start
    </.button>
    """
  end

  def start_button(%{running: true} = assigns) do
    ~H"""
    <.button id="stop-button" phx-click="stop" phx-disable-with="Stopping...">
      <.icon name="hero-pause" />&nbsp;Stop
    </.button>
    """
  end

  def reset_button(assigns) do
    ~H"""
    <.button id="reset-button" phx-click="reset">
      <.icon name="hero-arrow-uturn-left" />&nbsp;Reset
    </.button>
    """
  end

  @doc """
  Renders a back navigation link.

  ## Examples

      <.back navigate={~p"/posts"}>Back to posts</.back>
  """
  attr :navigate, :any, required: true
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def back(assigns) do
    ~H"""
    <div class={@class}>
      <.link navigate={@navigate} class="text-sm font-semibold leading-6">
        <.icon name="hero-arrow-left-solid" class="h-3 w-3" />
        {render_slot(@inner_block)}
      </.link>
    </div>
    """
  end
end
