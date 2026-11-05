-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Clear search, multicursors and stop snippet on escape
local map = LazyVim.safe_keymap_set
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")

  if vim.fn.mode() == "n" then
    local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
    vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
  end

  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })
