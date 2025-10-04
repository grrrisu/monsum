# Monsum

Component library based on Daisy and TailwindCSS

## Usage

### CSS

from your host application copy the `monsum.css` to `assets/vendor`

```bash
cp deps/monsum/assets/css/monsum.css assets/vendor
```

in your `assets/css/app.css` add the compontents as sources

```css
@source "../../deps/monsum/lib"

```

remove the default themes and replace it with:

```css
@plugin "../vendor/daisyui";

@import "../vendor/monsum.css";
```

in the layout replace `dark` with `monsum` if you want to keep the theme switch
or
add `data-theme="monsum"` to the `html` tag in `root.html.heex`

### Components

To have them globally availble, add to it to your `lib/myapp_web/myapp_web.ex`file

```elixir
defp html_helpers do
  quote do
    # HTML escaping functionality
    import Phoenix.HTML
    # Core UI components and translation
    import Monsum.MainComponents
    import Monsum.Buttons
    ...
  end
end
```

or import it whereever needed.

#### Core Components

Replace the `core_components.ex` with the one from Monsum

```bash
cp deps/lib/core_components.example lib/components/core_components.ex
```

Replace `MyAppWeb` with your namespace

### Javascript

Copy `monsum_hooks.js` to your vendor dir

```bash
cp deps/monsum/assets/js/monsum_hooks.js assets/vendor
```

Import it in your `app.js` file

```javascript
import MonsumHooks from "../vendor/monsum_hooks";

Hooks = {
  ...colocatedHooks,
  ...MonsumHooks
}
```
 
### Daisy Theme

https://daisyui.com/theme-generator/#theme=eJxtk-uOmzAQhV9lhFRpKxHkO6ZvQ2CSoAU7skG7bdV370CWTQz89JyP4zkz5m_m6gGzX9ngXZyGLM8a3_twis0Nl3rfXW8jlU-nh3CuI544YySF6_mNaxASlPi5RcQTEVAq4JztGPnNlGAr4FLukMa7Ed34hQlh6DoBQiVm99ANdfi9Qoqs5r7EAfNi6N_75vYm9A9gBavI1BQsDRKR6PbpLBUIzqkDe0htmrWgOZgErZvmqUvgTAM3fE9sYysGcyqh9SvrcBpD3X9HKdkShZrUpiitPWB38bl4fDPHV4Wpkgs6d_HrEmmDZt613AKbXnUOqsxp48mIJooV4-plgFtKLqoDZmPHyE7lIBO7jzq4zl3X6dBaeFmBPUA2bsYAvR7zCmIIPqyNWQYUVPEdsJtbZZe5MUmLKQurvy4PddtNkZ5Ej824-LJCBxxexUuHfbsoYiud_Wf6Sez-YOomUu3I7OxDizPN759LocX7eJvPy8n5Ls5_NqNTi5d66inWGCbMs3vAC4ZIj_n9Ufr3H6WQMF8

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `monsum` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:monsum, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/monsum>.
