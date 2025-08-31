defmodule Monsum.MainComponents do
  @moduledoc """
  uses tailwindcss and daisyui

  expects the following global classes:
  see assets/css/monsum.css
  """
  use Phoenix.Component

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

  attr :value, :any, required: true
  attr :icon, :string, required: true

  def info_card(assigns) do
    ~H"""
    <div>
      <span class="align-super">{@value}</span>
      <.icon name={@icon} class="la-2x" />
    </div>
    """
  end

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def main_title(assigns) do
    ~H"""
    <h1 class={["text-slate-200 text-4xl font-light mb-6", @class]}>
      {render_slot(@inner_block)}
    </h1>
    """
  end

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def title(assigns) do
    ~H"""
    <h2 class={["text-slate-200 text-2xl font-light mb-4", @class]}>
      {render_slot(@inner_block)}
    </h2>
    """
  end

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def sub_title(assigns) do
    ~H"""
    <h3 class={["text-slate-200 text-xl font-light mb-2", @class]}>
      {render_slot(@inner_block)}
    </h3>
    """
  end

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def small_title(assigns) do
    ~H"""
    <h4 class={["text-lg mb-2", @class]}>{render_slot(@inner_block)}</h4>
    """
  end

  attr :small, :string, required: true, doc: "smaller 768px"
  attr :medium, :string, default: nil, doc: "min 768px"
  attr :large, :string, default: nil, doc: "min 1024px"
  attr :class, :string, default: "w-full"

  def picture(assigns) do
    ~H"""
    <picture>
      <%= if @medium do %>
        <source srcset={@medium} media="(min-width: 768px)" />
      <% end %>
      <%= if @large do %>
        <source srcset={@large} media="(min-width: 1024px)" />
      <% end %>
      <img src={@small} class={@class} />
    </picture>
    """
  end

  attr :link, :string, required: true
  attr :class, :string, doc: "class "
  slot :icon
  slot :title
  slot :inner_block, required: true

  def hero_card(assigns) do
    ~H"""
    <div class={[
      "flex flex-col opacity-100 items-center space-y-3 text-center bg-sky-800 hover:bg-sky-700 rounded-xl border border-sky-600",
      @class
    ]}>
      <.link navigate={@link} class="w-full">
        <div class="p-6">
          <span class="inline-block p-3 text-white bg-sky-600 rounded-full">
            {render_slot(@icon)}
          </span>
          <h2 class="text-xl font-semibold text-sky-300 capitalize">
            {render_slot(@title)}
          </h2>
          <p class="text-sky-100">
            {render_slot(@inner_block)}
          </p>
        </div>
      </.link>
    </div>
    """
  end

  @doc """
  Renders a [Heroicon](https://heroicons.com).

  Heroicons come in three styles – outline, solid, and mini.
  By default, the outline style is used, but solid and mini may
  be applied by using the `-solid` and `-mini` suffix.

  You can customize the size and colors of the icons by setting
  width, height, and background color classes.

  Icons are extracted from your `assets/vendor/heroicons` directory and bundled
  within your compiled app.css by the plugin in your `assets/tailwind.config.js`.

  Renders a [LineAwesome Icons](https://icons8.com/line-awesome).

  ## Examples

      <.icon name="hero-x-mark-solid" />
      <.icon name="hero-arrow-path" class="ml-1 w-3 h-3 animate-spin" />

      <.icon name="la-frog" />
      <.icon name="la-spinner" class="la-spin" />
  """
  attr :name, :string, required: true
  attr :class, :string, default: nil
  attr :package, :string, default: "las"

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end

  def icon(%{name: "la-" <> _} = assigns) do
    ~H"""
    <span class={[@package, @name, @class]} />
    """
  end

  @doc """
  needs: JsonHook
  use push_event to populate component
  `push_event("update-json-<id>", data)`
  """

  attr :id, :string, required: true

  def json_ouput(assigns) do
    ~H"""
    <pre id={@id} class="text-xs" phx-hook="Json" phx-update="ignore"></pre>
    """
  end
end
