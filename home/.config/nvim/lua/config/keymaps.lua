local keymap = vim.api.nvim_set_keymap -- ??
local opts = { noremap = true, silent = true }

-- local leader map is set in nvim/init.lua

-- necessary 
keymap("i", "jj", "<Esc>", opts)

-- shell/emacs bindings
keymap("i", "<C-b>", "<Left>", opts)
keymap("i", "<C-f>", "<Right>", opts)
keymap("", "<C-a>", "<Esc>^", opts)
keymap("i", "<C-a>", "<Esc>I", opts)
keymap("", "<C-e>", "<Esc>$", opts)
keymap("i", "<C-e>", "<Esc>A", opts)

-- switch tabs
keymap("n", "<C-j>", "gT", opts)
keymap("n", "<C-k>", "gt", opts)

-- file control
keymap("n", "<Leader>a", "ggVG", opts)
keymap("n", "<Leader>s", ":w<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
keymap("n", "<Leader>Q", ":q!<CR>", opts)
 
-- cursor control
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<Down>", "gj", opts)
keymap("n", "<Up>", "gk", opts)

-- highlight
keymap("n", "<Leader>z", ":noh<CR>", opts)
