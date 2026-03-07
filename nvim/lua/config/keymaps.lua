-- Keymaps are automatically loaded by LazyVim
-- Add any additional keymaps here

local map = vim.keymap.set

-- Keep cursor centred when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Paste without overwriting register
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
