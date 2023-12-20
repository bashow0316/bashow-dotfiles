# bashow macOS arm setup memo 2023/12/19

## MacOS

- Intel CPU
- Apple m3 Pro

### Application install from App Stroe

``` code
xcode
iterm
1password
```

``` code
brew update && brew upgrade
```

### Zinit

[Zinit](https://github.com/zdharma-continuum/zinit)

``` code
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
```

### Homebrew

[Homebrew](https://brew.sh/)

- Install Homebrew

``` code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Rust

Install Rust

[Rust](https://www.rust-lang.org/)

``` code
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Application install from Homebrew

``` code
brew install wget
brew install git
brew install xz
brew install vim neovim
brew install pyenv pyenv-virtualenv
brew install --cask emacs
```

