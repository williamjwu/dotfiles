-- Neovim configuration.
-- Lives at ~/.config/nvim/init.lua (the location Neovim documents for the user
-- config under $XDG_CONFIG_HOME; see :help config and :help lua-guide).
-- Options are set with vim.opt, the recommended Lua interface (:help vim.opt).

-- Line numbers.
vim.opt.number = true

-- Mirror the rest of the .vimrc defaults in idiomatic Lua.
vim.opt.cursorline = true   -- highlight the current line
vim.opt.laststatus = 2      -- always show the status line

-- Syntax highlighting and filetype detection are on by default in Neovim,
-- so no explicit `syntax on` is needed (:help nvim-defaults).
