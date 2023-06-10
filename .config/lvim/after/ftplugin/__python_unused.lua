local util = require "lspconfig/util"
require("lvim.lsp.manager").setup("pylyzer", {
  name = "pylyzer",
  cmd = {"/home/minhdan/.local/share/cargo/bin/pylyzer", "--server" },
  filetypes = { "python" },
  root_dir = function(fname)
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
  end,
  settings = {
    python = {
      checkOnType = false,
      diagnostics = true,
      inlayHints = false,
      smartCompletion = true,
    },
  },
})
