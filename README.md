# dotfiles

## Background

This repo contains my dotfile configuration, allowing for a consistent computing experience across multiple machines.
In my normal workflow, I use mac os, ubuntu, and windows 11.

## Usage

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/).  This allows me to set up symlinks for all of my dotfiles using a single command, assuming that the repo has been cloned in ~:

```bash
stow .
```

Alternatively, one can only deploy certain dotfiles by using the command. Here is an example with the ``bash`` doftile:

```bash
stow bash -t ~
```

## Inspiration

The inspiration for this configuration comes from the following creators:

- [dreamsofcode](https://github.com/dreamsofcode-io/dotfiles)
- [mischa](https://github.com/mischavandenburg/dotfiles/)
- [devopstoolbox](https://github.com/omerxx/dotfiles)
- [xero](https://github.com/xero/dotfiles)
- [daviwil](https://github.com/daviwil/dotfiles)
- [mbvissers](https://github.com/mbvissers/dotfiles)
- [shakeelmohamed](https://github.com/shakeelmohamed/stow-dotfiles)
