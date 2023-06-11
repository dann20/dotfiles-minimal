-- vim.g.strip_whitespace_on_save = 1
-- vim.g.strip_whitespace_confirm = 0

local unmap_ws = {
  "<Space>s<Space>",
}

for _, v in ipairs(unmap_ws) do
  vim.keymap.set("n", v, "")
  vim.keymap.del("n", v)
end

vim.g.better_whitespace_filetypes_blacklist = {
  "dap-repl",
  "dap-terminal",
  "dapui_console",
  "toggleterm",
  "diff",
  "git",
  "gitcommit",
  "unite",
  "qf",
  "help",
  "markdown",
  "fugitive",
}
