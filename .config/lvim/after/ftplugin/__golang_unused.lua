-- setup your go.nvim
-- make sure lsp_cfg is disabled
require("mason").setup()
require("mason-lspconfig").setup()
require("go").setup {
  lsp_cfg = false,
  -- other setups...
  lsp_inlay_hints = { enable = false },
  lsp_keymaps = false,
}
local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup

require("lvim.lsp.manager").setup("gopls", cfg)
