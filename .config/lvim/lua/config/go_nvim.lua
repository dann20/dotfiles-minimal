local gotest = require("go.null_ls").gotest()
local gotest_codeaction = require("go.null_ls").gotest_action()
local golangci_lint = require("go.null_ls").golangci_lint()

require("null-ls").register(gotest)
require("null-ls").register(gotest_codeaction)
require("null-ls").register(golangci_lint)
