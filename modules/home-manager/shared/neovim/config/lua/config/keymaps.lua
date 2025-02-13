-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fr", function()
  Snacks.terminal(nil, { win = { position = "right" } })
end, { desc = "Terminal right" })

vim.keymap.set("n", "<leader>o", ":ObsidianQuickSwitch<CR>", { desc = "Open Obsidian Quick Switch" })
