### my neovim config

initialy based on [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua)

Prerequisite: 
- install [ripgrep](https://github.com/BurntSushi/ripgrep).

```shell
$ cargo install ripgrep
```

- install [Packer](https://github.com/wbthomason/packer.nvim)

> Unix, Linux Installation

```shell
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

> Windows Powershell Installation

```shell
> git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### windows notes

- default config path is %USERPROFILE%\AppData\Local\nvim
- default data path is %USERPROFILE%\AppData\Local\nvim-data

# keys mapping
- leader: &lt;space&gt;
- buffer select: &lt;leader&gt;bb
- help tags &lt;leader&gt;fh

## project keymapping
- project files: &lt;leader&gt;pf
- git files: &lt;C-p&gt;
- project search: &lt;leader&gt;ps
- project view: &lt;leader&gt;pv
- nvim-tree: &lt;leader&gt;t

## Editing
- Undotree: &lt;leader&gt;u
- format buffer: &lt;leader&gt;f
- :so : &lt;leader&gt;&lt;leader&gt;
- J and stay at line start: J
- yank to system buffer: &lt;leader&gt;y
- delete to system buffer: &lt;leader&gt;d
- regexp replace word under cursor: &lt;leader&gt;s

## Visual mode
- move selection down: J
- move selection up: K

## git
- Git state: &lt;leader&gt;gs

## LSP keymapping
- prev item: &lt;C-p&gt;
- next item: &lt;C-n&gt;
- confirm: &lt;C-y&gt;
- complete: &lt;C-.&gt;

### input mode
- signahure help: &lt;C-h&gt;


### normal mode
- definition: gd
- hover: K
- workspace symbol: &lt;leader&gt;vws
- diagnostic: &lt;leader&gt;vd
- diagnostic next: [d
- diagnostic prev: ]d
- code action: &lt;leader&gt;vca
- references: &lt;leader&gt;vrr
- rename: &lt;leader&gt;vrn

## other
- tmux-sessionizer: &lt;C-f&gt;  (unix only, require tmux and https://github.com/jrmoulton/tmux-sessionizer)

## comments

> NORMAL mode

- `gcc` - Toggles the current line using linewise comment
- `gbc` - Toggles the current line using blockwise comment
- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

> VISUAL mode

- `gc` - Toggles the region using linewise comment
- `gb` - Toggles the region using blockwise comment
