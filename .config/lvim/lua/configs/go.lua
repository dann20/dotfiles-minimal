local gotest = require("go.null_ls").gotest()
local gotest_codeaction = require("go.null_ls").gotest_action()
local golangci_lint = require("go.null_ls").golangci_lint()
local sources = {
  gotest,
  golangci_lint,
  gotest_codeaction,
}
require("null-ls").setup { sources = sources, debounce = 1000, default_timeout = 5000 }
