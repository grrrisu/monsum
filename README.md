# Monsum

Component library based on Daisy and TailwindCSS

## Usage

from your host application copy the `monsum.css` to `assets/vendor`

```bash
cp deps/monsum/assets/css/monsum.css assets/vendor
```

`import "../vendor/monsum.css"` in the `app.css`

in layout replace `dark` with `monsum` if you want to keep the theme switch
or
add `data-theme="monsum"` to the `html` tag in `root.html.heex`
 
### Daisy Theme

https://daisyui.com/theme-generator/#theme=eJyNk01ugzAQRq9isWqlUPkHG-htDAyJVYKRDWraqnfvQEuCDYsu7Xm8fDPjfCW9vkLymnTmfBmTU1LbzrrU1xcIrtP0t1BpDymjFEvuXD0xSbggGX-OEf5AOMkzwhjdMeLO5KQoCRNih9S2H6Ef_zDOFf4cJzwLZIMzV-0-VihD1ZyLHzCxUCKX5SjNt7AHxJqHUmSEM4ZUcUhF0oJIRlSA6rp-1AVhVBKm2J6I42WUzO1gzC3bwzQ63a3zpRT7VTi-8gDaGQu0oVUG0zF9a1cd7krNWxUx8L9wfsJOvF9tmKvAZnl5wMRCgduVAqWB8F273vTnO4T58pIUB0jkU4rgW1FbEJyz7m7iaCJS7IDdI8H1z9nWATvdmMnj_juox8VHX6SD67bYGuiapcLjUmVv4SfefEJo42HtSFZZ18BMs-G2XDQwjJf5vJx6a_z8_6V4aqDVU4ftjG6CUzI4aMF5fLlvv1ffPybpKVY

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

