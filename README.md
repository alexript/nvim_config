### my neovim config

initialy based on [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua)

Prerequisite: 
- install [ripgrep](https://github.com/BurntSushi/ripgrep).

```
$ cargo install ripgrep
```

- install [Packer](https://github.com/wbthomason/packer.nvim)

> Unix, Linux Installation

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

If you use Arch Linux, there is also [an AUR
package](https://aur.archlinux.org/packages/nvim-packer-git/).

> Windows Powershell Installation

```shell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### windows notes

- default config path is %USERPROFILE%\AppData\Local\nvim
- default data path is %USERPROFILE%\AppData\Local\nvim-data

# keys mapping
- leader: <space>
- buffer select: <leader>bb
- help tags <leader>fh

## project keymapping
- project files: <leader>pf
- git files: <C-p>
- project search: <leader>ps
- project view: <leader>pv
- nvim-tree: <leader>t

## Editing
- Undotree: <leader>u
- format buffer: <leader>f
- :so : <leader><leader>
- J and stay at line start: J
- yank to system buffer: <leader>y
- delete to system buffer: <leader>d
- regexp replace word under cursor: <leader>s

## Visual mode
- move selection down: J
- move selection up: K

## git
- Git state: <leader>gs

## LSP keymapping
- prev item: <C-p>
- next item: <C-n>
- confirm: <C-y>
- complete: <C-.>

### input mode
- signahure help: <C-h>


### normal mode
- definition: gd
- hover: K
- workspace symbol: <leader>vws
- diagnostic: <leader>vd
- diagnostic next: [d
- diagnostic prev: ]d
- code action: <leader>vca
- references: <leader>vrr
- rename: <leader>vrn

## other
- tmux-sessionizer: <C-f>  (unix only, require tmux and https://github.com/jrmoulton/tmux-sessionizer)

## comments

    NORMAL mode

- `gcc` - Toggles the current line using linewise comment
- `gbc` - Toggles the current line using blockwise comment
- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

    VISUAL mode

- `gc` - Toggles the region using linewise comment
- `gb` - Toggles the region using blockwise comment
