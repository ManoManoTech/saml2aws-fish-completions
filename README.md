# saml2aws-fish-completions [![github-ci-badge]][github-ci-link]

> Provides full completion support for `saml2aws` in `Fish`

![preview](preview.gif)

## Installation

```fish
fisher install ManoManoTech/saml2aws-fish-completions
```

## Usage

```fish
saml2aws <Tab>
```

## Tests

> **optional:** [`docker`](https://docs.docker.com/install/) (isolate from your environment), [`just`][cmd-runner] as command runner.

Specify the [`FISH_VERSION`][fish-releases] you want, and the `CMD` executed by the container:

    just FISH_VERSION=3.1.2 build-project-on
    just FISH_VERSION=3.1.2 CMD="fishtape tests/*.test.fish" dev-project-on

## Credit

<a href="manomano.com">
    <img src="https://raw.githubusercontent.com/ManoManoTech/visual-assets/main/logo/logo-ManoMano-horizontal-RGB-hor-color-positif.svg" width="25%" height="25%" alt="Online DIY, home improvement and gardening products">
</a>

</div>

## License

> MIT

[github-ci-link]: <https://github.com/ManoManoTech/saml2aws-fish-completions/actions> "Github CI"
[github-ci-badge]: <https://github.com/ManoManoTech/saml2aws-fish-completions/actions/workflows/.ci.yml/badge.svg>
[logo]: https://raw.githubusercontent.com/ManoManoTech/visual-assets/main/logo/logo-ManoMano-horizontal-RGB-hor-color-positif.svg
[manomano-website]: manomano.com
[cmd-runner]: https://github.com/casey/just
[fish-releases]: https://github.com/fish-shell/fish-shell/releases
