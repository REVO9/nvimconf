-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- insert mode
keymap.set("i", "<A-l>", "<ESC>", { desc = "Exit insert" })
keymap.set("i", "<C-h>", "<left>", { desc = "move left" })
keymap.set("i", "<C-l>", "<right>", { desc = "move right" })
keymap.set("i", "<C-j>", "<down>", { desc = "move down" })
keymap.set("i", "<C-k>", "<up>", { desc = "move up" })

-- clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- window nav
keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Window left" })
keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Window right" })
keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Window down" })
keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Window up" })

-- nvim-tree ------------------------
keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" }) -- toggle file explorer

-- trouble --------------------------
keymap.set("n", "<leader>e", "<cmd>Trouble<CR>", { desc = "open trouble"} )

-- notify ---------------------------
