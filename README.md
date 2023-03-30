### my neovim config

initialy based on [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua)

Prerequisite: install [ripgrep](https://github.com/BurntSushi/ripgrep).

### windows notes

- default config path is %USERPROFILE%\AppData\Local\nvim
- default data path is %USERPROFILE%\AppData\Local\nvim-data

# keys mapping
- leader: <space>

## project keymapping
- project files: <leader>pf
- git files: <C-p>
- project search: <leader>ps
- project view: <leader>pv
- :bprviouse : <M-h> or <M-Left>
- :bNext : <M-l> or <M-Right>

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
