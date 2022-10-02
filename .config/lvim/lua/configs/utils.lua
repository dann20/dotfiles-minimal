local M = {}

function M.strip_trailing_spaces()
  local excluded_ft = { "ruby", "markdown", "perl" }
  local ft = vim.bo.filetype
  for _, value in ipairs(excluded_ft) do
    if ft == value then
      return
    end
  end
  vim.cmd [[ %s/\s\+$//e ]]
end

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
