import Config

config :esbuild,
  version: "0.20.2",
  monsum: [
    args:
      ~w(assets/js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("..", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.0",
  monsum: [
    args: ~w(
      --config=config/tailwind.config.js
      --input=assets/css/app.css
      --output=priv/static/assets/app.css
      --minify
    ),
    cd: Path.expand("..", __DIR__)
  ]
