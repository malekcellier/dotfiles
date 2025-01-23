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
  - [Version Control](#version-control)
  - [File manager](#file-manager)
- [References](#references)

## ToDo

Here is the list of applications and utility, organized as a todo-list until I get them all done.

- [x] [alacritty](#alacritty)
- [X] [bash](#bash)
- [X] [brew](#brew)
- [X] [btop](#btop)
- [ ] [fish](#fish)
- [ ] [git](#git)
- [X] [iterm2](#iterm2)
- [ ] [k9s](#k9s)
- [ ] [lazygit](#lazygit)
- [ ] [nvim](#nvim)
- [ ] [ranger](#ranger)
- [ ] [ruff](#ruff)
- [ ] [sh](#sh)
- [ ] [starship](#starship)
- [ ] [tmux](#tmux)
- [ ] [uv](#uv)
- [x] [wezterm](#wezterm)
- [x] [yazi](#yazi)
- [ ] [zsh](#zsh)

## Background

This repo contains my dotfile configuration, allowing for a consistent coding experience across multiple machines. In my normal workflow, I use ``macos``, ``ubuntu``, and ``Windows 11`` and I want to minimize the differences between my experience in those environments.

As much as possible, I use the ``XDG`` base directory specification by setting the environment variable ``XDG_CONFIG_HOME`` like so:

```bash
export XDG_CONFIG_HOME="$HOME/.config"
```

## Usage

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/).  It can be installed using ``brew``:

```bash
brew install stow
```

``stow`` allows me to set up symlinks for all of my dotfiles using a single command, assuming that the repo has been cloned in ~:

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

As of ``2024-12-19`` here is how the ``github`` projects compare:

- ``Alacritty``: 57K :star:, 449 :eyes:, 3k forks, toml config, Apache License v2.0
- ``WezTerm``: 18.4K :star:, 93 :eyes:, 817 forks, lua config, MIT license

#### Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a cross-platform GPU-powered terminal emulator configured using ``toml`` files. It plays well with ``tmux``.

The configuration file is pretty straightforward to understand, the reference can be found in the [official documentation](https://alacritty.org/config-alacritty.html).

The main elements of interest are:

- the window appearance
- the font
- the cursor behavior
- the theme (catpuccin)

#### iTerm2

I use it occasionally. Configuration is done through the GUI and results in a ``*.plist`` file which can be placed anywhere in the file system.
The file location has to be set from the GUI in the following location:

- click ``iTerm2`` on the menu bar, then ``Settings...```
- navigate to ``General`` > ``Settings``
- select the checkbox named ``Loads settings from a custom folder or URL``
- click the ``Browse`` button and select a path, I have chosen ``/Users/<username>/dotfiles/iterm2``
- click the ``Save Now`` button which will save ``com.googlecode.iterm2.plist`` in the above mentionned folder

#### WezTerm

[WezTerm](https://github.com/wez/wezterm) is a cross-platform GPU-powered terminal emulator and multiplexer configured using ``lua`` files. It provides an alternative to ``tmux``.

The configuration file is actually a ``lua`` script, the reference can be found in the [official documentation](https://wezfurlong.org/wezterm/config/files.html).

### Shells

I use both ``bash`` and ``zsh`` which means that I have several files to manage.
The logical flow is as follows:

#### sh

#### bash

#### zsh

#### fish

### Shell prompt

#### starship

#### p10k

### Package manager

#### brew

I use ``brew`` as a package manager and complement it with [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) which also handles ``casks`` Mac applications, ``mas-cli`` Mac App Store applications and ``vscode`` extensions.

Dump packages to a ``Brewfile`` using:

```bash
brew bundle dump --force --describe
```

Reinstall packages:

```bash
brew bundle
```

#### Script

Alternatively, a simpler solution as in [here](https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh) can work too.

### Version Control

#### git

#### lazygit

Uses a ``config.yml`` file. One can use the ``catppuccin`` theme but it requires to include the content (no referencing seems possible).

### File manager

#### ranger

``ranger`` is a console file browser/manager.

The configuration is done using ``rc.conf`` see [ranger conf](https://github.com/ranger/ranger/blob/master/ranger/config/rc.conf) as well as ``commands.py``, see [ranger command](https://github.com/ranger/ranger/blob/master/ranger/config/commands.py).

#### yazi

``yazi`` is a modern alternative to ``ranger`` written in ``Rust``. It is noticeably faster than ``ranger`` especially for network volumes (``SMB``).

The configuration is done through a ``yazi.toml`` file.

### Productivity

#### btop

``btop`` is a resource monitor, it provides graphs for memory, cpu, and network usage.

The configuration is done using a ``btop.conf`` file, which can be edited from the tool itself. The main parameter I use is the theme and the **braille** graph symbol.

#### k9s

#### nvim

#### tmux

#### uv

#### ruff

``ruff`` is an extremely fast Python linter and code formatter, written in Rust.

##### Install

```bash
uv tool install ruff@latest  # Install Ruff globally.
```

##### Configuration

A ``.ruff.toml`` file is used (other names are accepted too). ``ruff`` supports up to 800 lint rules (autoflake, flake8, pylint, pep8..)

##### Usage

To run ``ruff`` as a linter.

```bash
ruff check
```

To run ``ruff`` as a formatter.

```bash
ruff format
```

## References

### Guides

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
