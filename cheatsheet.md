# Cheatsheet

## Ghostty — macOS defaults

| Key | Action |
|-----|--------|
| `Cmd+T` | New tab |
| `Cmd+W` | Close tab/split |
| `Cmd+D` | New split (right) |
| `Cmd+Shift+D` | New split (down) |
| `Cmd+]` / `Cmd+[` | Next / previous tab |
| `Cmd+1-9` | Switch to tab 1-9 |
| `Cmd+Opt+Arrow` | Navigate between splits |
| `Cmd+Shift+Enter` | Toggle split zoom |
| `Cmd+N` | New window |
| `Cmd+Shift+W` | Close window |
| `Cmd+C` | Copy |
| `Cmd+V` | Paste |
| `Cmd+K` | Clear scrollback |
| `Cmd+Shift+,` | Reload config |
| `Cmd++` / `Cmd+-` | Increase / decrease font size |
| `Cmd+0` | Reset font size |
| `Cmd+Q` | Quit Ghostty |

## Ghostty — Fedora/Linux defaults

| Key | Action |
|-----|--------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab/split |
| `Ctrl+Shift+O` | New split (right) |
| `Ctrl+Shift+E` | New split (down) |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Next / previous tab |
| `Ctrl+Shift+Arrow` | Navigate between splits |
| `Ctrl+Shift+Z` | Toggle split zoom |
| `Ctrl+Shift+N` | New window |
| `Ctrl+Shift+C` | Copy |
| `Ctrl+Shift+V` | Paste |
| `Ctrl+Shift+,` | Reload config |
| `Ctrl++` / `Ctrl+-` | Increase / decrease font size |
| `Ctrl+0` | Reset font size |
| `Ctrl+Shift+Q` | Quit Ghostty |

---

# Neovim Cheatsheet

Leader key: `<Space>`

## Motions

| Key | Action |
|-----|--------|
| `h j k l` | Left, Down, Up, Right |
| `w` / `b` | Next / previous word |
| `e` | End of word |
| `0` / `$` | Start / end of line |
| `^` | First non-blank character |
| `gg` / `G` | Top / bottom of file |
| `{` / `}` | Previous / next paragraph |
| `%` | Jump to matching bracket |
| `f{char}` / `F{char}` | Jump to next / prev char on line |
| `t{char}` / `T{char}` | Jump to before next / after prev char |
| `;` / `,` | Repeat / reverse last f/t |

## Editing

| Key | Action |
|-----|--------|
| `i` / `a` | Insert before / after cursor |
| `I` / `A` | Insert at start / end of line |
| `o` / `O` | New line below / above |
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` / `P` | Paste after / before |
| `u` / `<C-r>` | Undo / redo |
| `ciw` | Change inner word |
| `ci"` | Change inside quotes |
| `di(` | Delete inside parentheses |
| `.` | Repeat last change |

## Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `<C-v>` | Block visual |
| `J` | Move selection down (custom) |
| `K` | Move selection up (custom) |

## Navigation

| Key | Action |
|-----|--------|
| `<C-d>` / `<C-u>` | Half-page down / up (cursor stays centred) |
| `<C-f>` / `<C-b>` | Full page down / up |
| `:{n}` | Jump to line number n |
| `<C-o>` / `<C-i>` | Jump back / forward in jumplist |
| `gd` | Go to definition (LSP) |
| `gr` | Go to references (LSP) |
| `gI` | Go to implementation (LSP) |
| `K` | Hover docs (LSP) |
| `<C-]>` | Follow tag / definition |
| `<leader>e` | Toggle file explorer (neo-tree) |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bb` / `<C-^>` | Toggle between last two files |
| `<leader>bd` | Delete buffer |
| `[b` / `]b` | Previous / next buffer |
| `[d` / `]d` | Previous / next diagnostic |
| `[q` / `]q` | Previous / next quickfix item |
| `<C-h/j/k/l>` | Move between windows/splits |
| `<C-Arrow>` | Resize windows |
| `<leader>-` | Horizontal split |
| `<leader>\|` | Vertical split |
| `m{a-z}` | Set mark |
| `'{a-z}` | Jump to mark |
| `''` | Jump back to last position before jump |

## Find & Grep (fzf-lua)

| Key | Action |
|-----|--------|
| `<leader>/` | Grep across all files (root dir) |
| `<leader><space>` | Find files (root dir) |
| `<leader>ff` | Find files (root dir) |
| `<leader>fF` | Find files (cwd) |
| `<leader>fg` | Find files (git-files) |
| `<leader>fb` | Find open buffers |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find config files |
| `<leader>sg` | Grep (root dir) |
| `<leader>sG` | Grep (cwd) |
| `<leader>sw` | Grep word under cursor |
| `<leader>sb` | Search lines in current buffer |
| `<leader>sd` | Workspace diagnostics |
| `<leader>sD` | Buffer diagnostics |
| `<leader>ss` | Goto symbol (document) |
| `<leader>sS` | Goto symbol (workspace) |
| `<leader>sh` | Help pages |
| `<leader>sk` | Keymaps |
| `<leader>sm` | Jump to mark |
| `<leader>sM` | Man pages |
| `<leader>sj` | Jumplist |
| `<leader>sq` | Quickfix list |
| `<leader>sR` | Resume last picker |
| `<leader>st` | Todo comments |
| `<leader>:` | Command history |
| `<leader>gc` | Git commits |
| `<leader>gs` | Git status |

**Inside fzf picker:**

| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Next / previous result |
| `<CR>` | Open selected |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<Esc>` | Close picker |

## Search & Replace

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `*` / `#` | Search word under cursor fwd / back |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirm |
| `<Esc>` | Clear search highlight (custom) |

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Go to implementation |
| `K` | Hover docs |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>xx` | Trouble diagnostics |

## LazyVim Misc

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit |
| `<leader>w` | Save file (custom) |
| `<leader>p` | Paste without yanking (custom, visual mode) |

## Lazygit (inside `<leader>gg`)

| Key | Action |
|-----|--------|
| `q` | Quit lazygit |
| `h` / `l` | Navigate between panels |
| `j` / `k` | Move up / down in panel |
| `Space` | Stage / unstage file |
| `a` | Stage / unstage all files |
| `c` | Commit staged changes |
| `p` | Pull |
| `P` | Push |
| `s` | Stash changes |
| `S` | View stash |
| `Enter` | View file diff / expand |
| `d` | Discard changes (file or hunk) |
| `b` | Branch actions menu |
| `n` | New branch |
| `/` | Search in current panel |
| `[` / `]` | Previous / next conflict |
| `z` | Undo last git action |
| `?` | Show all keybindings |

## Plugins (Custom)

| Key | Action |
|-----|--------|
| `<leader>mp` | Toggle Markdown Preview (browser) |
