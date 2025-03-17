-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local discipline = require("utils.discipline")
discipline.cowboy()
local map = vim.keymap.set

-- ---------- Window Management ---------- ---
map("n", "te", ":tabedit")

-- Quick comment/uncomment with <leader>/
map("n", "<leader>#", "gcc", { desc = "Toggle Comment (Line)", remap = true })
map("v", "<leader>#", "gc", { desc = "Toggle Comment (Selection)", remap = true })

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)
