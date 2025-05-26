<p align="center">
  <h1 align="center">utf8-validate</h1>
  <p align="center">
    A utf8 validator written in luau
    <br />
  </p>
</p>

> [!NOTE]
> The original source code for the validator used in this project can be found [here](https://github.com/FourierTransformer/utf8validator)

## Features
- Validate whether a string contains only valid utf8 characters

## Installation
Add to your `wally.toml`:
```toml
utf8_validate = "ophidiedev/utf8-validate@1.0.0"
```

Add to your `pesde.toml`:
```toml
utf8_validate = { name = "ophidiedev/utf8_validate", version = "^1.0.0" }
```

Add to your `package.json`:
```json
"@rbxts/utf8-validate": "^1.0.0"
```

## Read More
If you are interested in reading more about the problem this package solves, consider reading [this story](https://blog.vorlias.nz/2023/09/breaking-an-economy-using-a-sign) by community member [Vorlias](https://vorlias.nz/).

## Licenses
- The original source code for the validator (utf8validator.lua) is MIT Licensed the original source can be found [here](https://github.com/FourierTransformer/utf8validator).
