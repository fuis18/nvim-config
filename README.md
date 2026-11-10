# 🚀 My Neovim Config

Personal Neovim configuration built on top of [LazyVim](https://www.lazyvim.org), managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- [Neovim](https://github.com/neovim/neovim) >= 0.10 (0.12+ for native Copilot)
- `git`
- `ripgrep` and `fd` (for fuzzy finding / picker)
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `node`/`npm` (vtsls, prettier, copilot-language-server)
- `xxd` (hex editing)

## Language Extras

Enabled via `lazyvim.json`:

- TypeScript (`vtsls`)
- Astro
- Svelte
- Go, Rust, YAML, Docker, SQL, JSON
- Formatting (prettier), linting (eslint), debugging (dap), testing (neotest)

Treesitter also installs: `css`, `html_tags`, `astro`, `svelte`, `vue`. Markdown `.mdx` files are mapped to `markdown.mdx`.

## Plugins

### Coding

| Plugin | Description |
|---|---|
| [mini.pairs](https://github.com/nvim-mini/mini.pairs) | Auto pairs |
| [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) | Treesitter-powered comment syntax |
| [mini.ai](https://github.com/nvim-mini/mini.ai) | Extended text objects (`f` function, `c` class, `o` block...) |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | LuaLS completions for editing Neovim configs |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Add/change/delete surrounding pairs |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine (super-tab preset) |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting via the LazyVim prettier extra |
| [GitHub Copilot (native)](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/ai/copilot-native.lua) | Inline ghost-text suggestions via `copilot-language-server` (LazyVim extra `ai.copilot-native`) |

### Editor

| Plugin | Description |
|---|---|
| [leap.nvim](https://codeberg.org/andyg/leap.nvim) | Jump with `s` / `S`, enhanced `f`/`F`/`t`/`T`, cross-window `gs` |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding popup (helix preset) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs & hunk staging |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics, symbols and lists |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO/FIX/HACK comments |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | Highlight other uses of the word under cursor |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Floating context of the current function |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multi-cursor editing |
| [hex.nvim](https://github.com/RaafatTurki/hex.nvim) | Hex view/edit of binary files via `xxd` (`:HexDump`, `:HexAssemble`, `:HexToggle`; auto-detects `nvim -b`) |

### UI & Markdown

| Plugin | Description |
|---|---|
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Render markdown inline |
| [snacks.nvim image](https://github.com/folke/snacks.nvim) | Inline images & mermaid previews |
| [mini.hipatterns](https://github.com/nvim-mini/mini.hipatterns) | CSS color previews & Tailwind classes |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline sidebar (with statusline symbols) |
| Snacks dashboard | Custom ASCII header from `hydra.txt` |

### Testing

| Plugin | Description |
|---|---|
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner with python, plenary, golang and rustaceanvim adapters |

## Key Custom Keymaps

| Key | Action |
|---|---|
| `<leader>e` | Toggle file explorer (snacks) |
| `s` / `S` | Leap forward / backward (normal mode; `S` in visual = surround) |
| `gs` | Leap across windows |
| `<C-n>` | Multi-cursor: select word under cursor |
| `<C-Up>` / `<C-Down>` | Multi-cursor: add cursor up/down |
| `<leader>a` | Toggle code outline (aerial) |
| `<leader>nn` | Run nearest test |
| `<leader>nN` | Run all tests in file |
| `<leader>nl` | Re-run last test |
| `<leader>ns` | Toggle test summary |
| `<leader>no` | Open test output |
| `<leader>?` | Buffer keymaps (which-key) |
| `Tab` | Accept completion / Copilot ghost-text suggestion |
| `<M-]>` / `<M-[>` | Next / previous Copilot suggestion |

## GitHub Copilot

Inline ghost-text suggestions powered by the official `copilot-language-server` (LazyVim extra `ai.copilot-native`). Requires Neovim >= 0.12.

**One-time setup:** open Neovim and run (from any buffer):

```vim
:LspCopilotSignIn
```

This copies a one-time code to your clipboard and asks you to authorize it in the browser with your GitHub account (Copilot Free works). If you are already signed in — e.g. via the `gh` CLI — it just reports `Already signed in`. Use `:LspCopilotSignOut` to log out. Until you sign in, suggestions stay inactive.

LazyVim default keymaps still apply — check them inside Neovim with `<leader>?`.
