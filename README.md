# dotfiles

## TOC

[dotfiles](#dotfiles)

- [Background](#background)
- [Usage](#usage)
- [Applications](#applications)
  - [Terminal Emulators](#terminal-emulators)
  - [Shells](#shells)
  - [Shell Prompt](#shell-prompt)
  - [Package Manager](#package-manager)
  - [Git](#git)
  - [File manager](#file-manager)
- [Resources](#resources)

## ToDo

- [-] alacritty
- [X] bash
- [X] brew
- [-] btop
- [ ] fish
- [ ] git
- [ ] iterm2
- [ ] k9s
- [ ] karabiner
- [ ] lazygit
- [ ] nvim
- [ ] ranger
- [-] sh
- [ ] starship
- [ ] tmux
- [ ] uv
- [-] wezterm
- [ ] yazi
- [-] zsh

## Background

This repo contains my dotfile configuration, allowing for a consistent computing experience across multiple machines.
In my normal workflow, I use mac os, ubuntu, and windows 11.

As much as possible, I use the ``XDG`` base directory specification with ``XDC_CONFIG_HOME``.

## Usage

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/).  This allows me to set up symlinks for all of my dotfiles using a single command, assuming that the repo has been cloned in ~:

```bash
stow .
```

Alternatively, one can only deploy certain dotfiles by using the command. Here is an example with the ``bash`` doftile:

```bash
stow bash -t ~
```

## Applications

### Terminal Emulators

I currently use 2 different terminals and I have yet to decide on which one to settle.

As of ``2024-12`` here is how the ``github`` projects compare:

- ``Alacritty``: 56.8K :star:, 449 :eyes:, 3k forks, toml config, Apache License v2.0
- ``WezTerm``: 18.2K :star:, 90 :eyes:, 813 forks, lua config, MIT license

#### Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a cross-platform GPU-powered terminal emulator configured using ``toml`` files.
It plays well with ``tmux``.

#### WezTerm

[WezTerm](https://github.com/wez/wezterm) is a cross-platform GPU-powered terminal emulator and multiplexer configured using ``lua`` files.
It provides an alternative to ``tmux``.

#### iTerm2

I use it occasionally. Configuration is done through the GUI and results in a ``*.plist`` file.

### Shells

I use both ``bash`` and ``zsh`` which means that I have several files to manage.
The logical flow is as follows:

#### bash

#### zsh

### Shell prompt

#### starship

### Package manager

#### brew

I use ``brew`` as a package manager and complement it with [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) which also handles ``casks`` Mac applications, ``mas-cli`` Mac App Store applications and ``vscode`` extensions.

Dump packages to a ``Brewfile`` using:

```bash
brew bundle dump --describe
```

Reinstall packages:

```bash
brew bundle
```

#### Script

Alternatively, a simpler solution as in [here](https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh) can work too.

### Git

#### git config

#### lazygit

Uses a ``config.yml`` file. One can use the ``catppuccin`` theme but it requires to include the content (no referencing seems possible).

### File manager

#### ranger

#### yazi

## Resources

### Reference guides

- [dotfiles guide](https://dotfiles.github.io/)
- [awesome dotfile](https://github.com/webpro/awesome-dotfiles)

### Inspiration

The inspiration for this configuration comes from the following creators:

- [dreamsofcode](https://github.com/dreamsofcode-io/dotfiles)
- [mischa](https://github.com/mischavandenburg/dotfiles/)
- [devopstoolbox](https://github.com/omerxx/dotfiles)
- [xero](https://github.com/xero/dotfiles)
- [daviwil](https://github.com/daviwil/dotfiles)
- [mbvissers](https://github.com/mbvissers/dotfiles)
- [shakeelmohamed](https://github.com/shakeelmohamed/stow-dotfiles)
