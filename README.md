# ppx_bsx_example

## Install `ppx_bsx`

Clone this repo, and cd to its dir.

```sh
opam switch create . 4.06.1
eval $(opam env)
opam update
opam install ppx_bsx
```

Config `bsconfig.json`:

```json
{
  "ppx-flags": [
    "./_opam/bin/ppx_bsx",
    "./node_modules/bs-platform/lib/bsppx.exe -bs-jsx 3"
  ]
}
```

## Install npm dependencies

Run `yarn` or `npm install`.

## Run

- for development: `yarn dev` or `npm run dev`
- for production / distribution: `yarn dist` or `npm run dist`
