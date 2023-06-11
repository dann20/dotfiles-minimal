local M = {}

function M.set_terminal_keymaps()
  -- for ToggleTerm
  local opts = { noremap = true, silent = true, buffer = true }
  vim.keymap.set("t", "<M-n>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<M-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.keymap.set("t", "<M-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.keymap.set("t", "<M-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.keymap.set("t", "<M-l>", [[<C-\><C-n><C-W>l]], opts)
end

return M
