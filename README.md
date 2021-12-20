# Neovim from scratch

## Try out this config

Make sure to remove or move your current `nvim` directory

```sh
git clone https://github.com/jbabin91/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get Healthy

open `nvim` and enter the following:

```sh
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On MacOS `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel
  ```

- On Arch Linux

  ```sh
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```
