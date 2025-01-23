# dotfiles

## TOC

[dotfiles](#dotfiles)

- [Background](#background)
- [Dotfiles management](#dotfiles-management)
- [Applications](#applications)
  - [Terminal Emulators](#terminal-emulators)
  - [Shells](#shells)
  - [Shell Prompt](#shell-prompt)
  - [Package Manager](#package-manager)
  - [Version Control](#version-control)
  - [File Manager](#file-manager)
  - [Productivity](#productivity)
  - [Coding](#coding)
- [References](#references)

## To Dos

Here is the ordered list of applications and utility, organized as a todo-list until I get them all done.

- [X] [alacritty](#alacritty)
- [X] [bash](#bash)
- [X] [brew](#brew)
- [X] [btop](#btop)
- [ ] [fzf](#fzf)
- [ ] [git](#git)
- [X] [iterm2](#iterm2)
- [ ] [k9s](#k9s)
- [ ] [lazygit](#lazygit)
- [ ] [nvim](#nvim)
- [ ] [obsidian](#obsidian)
- [ ] [ranger](#ranger)
- [X] [ruff](#ruff)
- [ ] [sh](#sh)
- [ ] [starship](#starship)
- [ ] [tmux](#tmux)
- [ ] [uv](#uv)
- [ ] [vscode](#vscode)
- [X] [wezterm](#wezterm)
- [X] [yazi](#yazi)
- [ ] [zsh](#zsh)
- [ ] [zoxide](#zoxide)

## Background

This repo contains my ``dotfile`` configuration, allowing for a consistent coding experience across multiple machines. In my normal workflow, I use ``macos``, ``ubuntu``, and ``Windows 11`` and I want to minimize the differences between my experience in those environments.

## Dotfiles management

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/). It takes care of creating and managint he lifecycle of symbolic links while keeping the configuration files neatly organized under a single folder ``dotfiles``.

### Installation

``GNU Stow`` can be installed using ``brew``:

```bash
brew install stow
```

### Folder structure

As much as possible, I use the ``XDG`` base directory specification by setting the environment variable ``XDG_CONFIG_HOME`` in my ``.profile`` file. More on that in the section dedicated to [Shells](#shells).

```bash
export XDG_CONFIG_HOME="$HOME/.config"
```

This also means that most dotfiles would be hosted under a ``.config`` folder. There are some exceptions to that, for example the ``bash``and ``zsh`` files.
Each application which uses a ``dotfile`` should have its own eponymous subfolder under ``dotfiles``. It should contain a ``.config`` folder which in turn should contain the configuration file expected by the application.

As an example, let's consider the ``dotfile`` for ``nvim``. The folder structure would look like this:

```bash
dotfiles/
├─ nvim/
│  ├─ .config/
│  │  ├─ nvim/
│  │  │  ├─ init.lua
```

### Setup

``stow`` creates symlinks for all the dotfiles at once using a single command. Assuming that the repo has been cloned into ``dotfiles``:

```bash
cd dotfiles
stow .
```

Alternatively, one can only deploy certain dotfiles by using the command. Here is an example with the ``bash`` doftile:

```bash
stow bash
```

See more options in the [Stow documentation](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow).

## Applications

### Terminal Emulators

I currently use 2 different terminals and I have yet to decide on which one to settle.

As of ``2025-01-23`` here is how the ``github`` projects compare:

- ``Alacritty``: 57.4K :star:, 451 :eyes:, 3.1k forks, toml config, Apache License v2.0
- ``WezTerm``: 19K :star:, 94 :eyes:, 833 forks, lua config, MIT license

#### Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a cross-platform GPU-powered terminal emulator configured using ``toml`` files. It plays well with ``tmux``.

The configuration file ``alacritty.toml`` is pretty straightforward to understand, the reference can be found in the [official documentation](https://alacritty.org/config-alacritty.html).

The main elements of interest are:

- the window appearance
- the font
- the cursor behavior
- the theme (``catppuccin``)

##### Theme

A theme is self contained in a ``toml`` file. There are several sources available, one of which is [alacritty-theme](https://github.com/alacritty/alacritty-theme). The repo can be cloned and placed under ``alacritty/.config/themes``. Then provide the path to the theme of your choice within the ``alacritty.toml`` configuration file. The downside is that some themes (notably the ``catpuccin`` ones) have not seen any updates in over 2 years.

Alternatively, one can download directly the theme from the ``catpuccin`` github repository. I use the ``mocha`` flavor of the ``catpuccin`` theme. To install, copy the theme files from [catpuccin alacritty](https://github.com/catppuccin/alacritty/tree/main) and place them under the ``alacritty`` folder under ``.config``, then add the correct import statement to refer to the right ``toml`` file:

```toml
[general]
import = [    
    # Provide the path to the theme flavour you want below:
    "~/.config/alacritty/catppucin-theme/catppuccin-mocha.toml",
    # "~/.config/alacritty/alacritty-theme/dawnfox.toml"
]
```

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

The configuration file is actually a ``lua`` script, the reference can be found in the [official documentation](https://wezfurlong.org/wezterm/config/files.html). The main idea is to create a config object, modify it with the desired options, and finally return it.

For example, changing the theme is as easy as:

```lua
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

return config
```

### Shells

I use both ``bash`` and ``zsh`` which means that I have several files to manage.
The logical flow is as follows:

#### sh

#### bash

#### zsh

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

#### zoxide

A smarter ``cd`` command. To install:

```bash
eval "$(zoxide init bash)"
```

### Productivity

#### btop

``btop`` is a resource monitor, it provides graphs for memory, cpu, and network usage.

The configuration is done using a ``btop.conf`` file, which can be edited from the tool itself. The main parameter I use is the theme and the **braille** graph symbol.

#### fzf

#### k9s

#### obsidian

#### tmux

Famous terminal session manager with 3 abstractions layers: ``session``, ``window`` (within a ``session``), and ``pane`` (splits a window in several terminals).
It does not have session persistency across reboots though but this can be fixed using a plugin.

The configuration is done using a ``.tmux.conf`` file located in ``.config/tmux``. Remapping the prefix is the most typical setting, mine is set to ``C-A`` since the letter ``A`` is closest to ``Ctrl``.

Other useful settings:

- Start numbering the windows and panes starting at 1. This makes switching between them easier using the shorcut ``Prefix-3`` to move to the window number 3.

### Coding

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

#### nvim

#### vscode

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
