local shutil = require "utility.shutil"

-- vim general
vim.opt.showmode = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.shell = "/bin/sh"
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.iskeyword:remove { "_" }
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.showcmd = true
vim.opt.timeoutlen = 250

-- LunarVim general
lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.rs", "*.lua" },
}
lvim.colorscheme = "one_monokai"
-- lvim.transparent_window = true
-- lvim.builtin.lualine.options.theme = "moonfly"
-- vim.g.moonflyTransparent = 1

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-L>"] = false
local unmap_keys = {
  "<C-L>",
  "<C-H>",
  "<C-J>",
  "<C-K>",
}
local unmap_modes = { "n", "t" }
for _, key in ipairs(unmap_keys) do
  -- set keymaps to empty strings and then delete them
  -- to avoid stupid warnings of "no such mappings"
  vim.keymap.set(unmap_modes, key, "")
  vim.keymap.del(unmap_modes, key)
end
vim.keymap.set("i", "jk", "")
vim.keymap.del("i", "jk")
vim.keymap.set("i", "kj", "")
vim.keymap.del("i", "kj")

-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.keymap.set("n", "<M-l>", "<C-W>l")
vim.keymap.set("n", "<M-h>", "<C-W>h")
vim.keymap.set("n", "<M-j>", "<C-W>j")
vim.keymap.set("n", "<M-k>", "<C-W>k")

vim.keymap.set("n", "S", ":%s//g<Left><Left>")
vim.keymap.set("n", "<M-e>", vim.diagnostic.open_float)

-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

vim.keymap.set("n", "<S-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<S-h>", "<cmd>bp<cr>")

-- copilot configs
-- vim.g.copilot_filetypes = { rust = false }
-- vim.keymap.set("i", "<C-L>", 'copilot#Accept("")', { expr = true, silent = true, script = true })

-- autopairs config
lvim.builtin.autopairs.enable_check_bracket_line = true

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["z"] = { "<cmd>StripWhitespace<cr>", "Clear Trailing Spaces" }
-- lvim.builtin.which_key.mappings["a"] = {
--     name = "+Copilot",
--     s = { "<cmd>vertical Copilot<cr>", "Synthesize solutions" },

--     p = { function ()
--         local status = vim.api.nvim_exec("Copilot status", true)
--         notify(status, "info", { title = "Copilot" })
--     end, "Status" },

--     d = { function ()
--         vim.cmd("Copilot disable")
--         lvim.builtin.cmp.experimental.ghost_text = true
--         completion.setup(lvim.builtin.cmp) -- WARNING due to the overloading implementation of LunarVim over nvim-cmp
--         notify("Copilot is disabled!", "info", { title = "Copilot" })
--     end, "Disable Copilot" },

--     e = { function ()
--         vim.cmd("Copilot enable")
--         lvim.builtin.cmp.experimental.ghost_text = false
--         completion.setup(lvim.builtin.cmp)
--         notify("Copilot is enabled!", "info", { title = "Copilot" })
--     end, "Enable Copilot" },
-- }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
  l = { "<cmd>Trouble loclist<cr>", "Location List" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  t = { "<cmd>Trouble lsp_type_definitions<cr>", "Type Definitions" },
}
lvim.builtin.which_key.mappings["n"] = {
  name = "+Annotations",
  f = {
    function()
      require("neogen").generate()
    end,
    "Function",
  },
  c = {
    function()
      require("neogen").generate { type = "class" }
    end,
    "Class",
  },
  t = {
    function()
      require("neogen").generate { type = "type" }
    end,
    "Type",
  },
}
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = shutil.which "fish"
lvim.builtin.terminal.open_mapping = "<c-_>" -- remap to <C-/>

lvim.builtin.nvimtree.setup.view.side = "left"

lvim.builtin.bufferline.options.offsets[2].highlight = false
lvim.builtin.bufferline.highlights.tab_selected = { fg = "#ebf1fa" }

lvim.builtin.dap.active = true
lvim.builtin.dap.stopped.linehl = ""

lvim.builtin.autopairs.disable_in_macro = true

lvim.builtin.which_key.setup.ignore_missing = true
lvim.builtin.which_key.setup.triggers_blacklist.n = { "d", "y", "c" }
lvim.builtin.which_key.setup.triggers_blacklist.i = { "j", "k", "d", "y", "c" }
lvim.builtin.which_key.setup.triggers_blacklist.v = { "j", "k", "d", "y", "c" }

lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.show_first_indent_level = false
lvim.builtin.indentlines.options.use_treesitter = false

lvim.builtin.illuminate.active = false

local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.sections.lualine_a = { components.mode, components.filename }

-- Fix #2876 LunarVim
local cmp = require "cmp"
lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm { select = true }

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "fish",
  "c",
  "cpp",
  "make",
  "cmake",
  "javascript",
  "html",
  "css",
  "lua",
  "python",
  "rust",
  "java",
  "yaml",
  "json",
  "toml",
  "vim",
  "dockerfile",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow = {
  enable = true,
  -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = 1000, -- Do not enable for files with more than n lines, int
  query = "rainbow-parens",
  strategy = require("ts-rainbow").strategy.global,
  -- colors = {}, -- table of hex strings
  -- termcolors = {} -- table of colour name strings
}

-- generic LSP settings
vim.diagnostic.config { virtual_text = false }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

---@usage Disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "rust_analyzer", "azure_pipelines_ls" })

---@usage Exclude server from skipped_servers list
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "ruff_lsp"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", extra_args = { "--line-length", "90" }, filetypes = { "python" } },
  { command = "isort", extra_args = { "--profile", "black", "--line-length", "90" }, filetypes = { "python" } },
  { command = "stylua", filetypes = { "lua" } },
  {
    command = "clang-format",
    args = { "--style", "Google" },
    filetypes = { "c", "cpp", "cs", "java" },
  },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
  { command = "golines", extra_args = { "--base-formatter=gofumpt" }, filetypes = { "go" } },
  { command = "goimports", filetypes = { "go" } },
  { command = "protolint", filetypes = { "proto" } },
  { command = "djlint", extra_args = { "--profile=jinja" } },
  { command = "shellharden", filetypes = { "bash", "sh" } },
  { command = "beautysh", filetypes = { "bash", "sh" } },
  { command = "jq", extra_args = { "--indent", "4" }, filetypes = { "json" } },
  -- not needed anymore because rust-analyzer already handles formatting function.
  -- { command = "rustfmt", extra_args = { "--edition=2021" }, filetypes = { "rust" } },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "ruff", filetypes = { "python" } },
  -- { command = "pylint", extra_args = { "--fail-under", "9.5" }, filetypes = { "python" } },
  { command = "mypy", filetypes = { "python" } },
  { command = "cppcheck", filetypes = { "c", "cpp" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  { command = "gitlint", filetypes = { "gitcommit" } },
  { command = "protolint", filetypes = { "proto" } },
  { command = "djlint", extra_args = { "--profile=jinja" } },
  -- { command = "revive", filetypes = { "go" } },
  -- { command = "staticcheck", filetypes = { "go" } },
  -- { command = "eslint_d", filetypes = { "javascript" } },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

lvim.builtin.which_key.mappings["G"] = {
  name = "+Golang",
  M = { "<cmd>GoMake<CR>", "GoMake" },
  b = { "<cmd>GoBuild<CR>", "GoBuild" },
  f = { "<cmd>GoFmt<CR>", "GoFmt" },
  i = { "<cmd>GoImport<CR>", "GoImport" },
  T = { "<cmd>GoTest<CR>", "GoTest" },
  o = { "<cmd>GoPkgOutline<CR>", "GoPkgOutline" },
  C = {
    function()
      require("go.comment").gen()
    end,
    "GoCmt",
  },
  m = {
    name = "+Mod",
    i = { "<cmd>GoModInit<CR>", "GoModInit" },
    t = { "<cmd>GoModTidy<CR>", "GoModTidy" },
    v = { "<cmd>GoModVendor<CR>", "GoModVendor" },
  },
  c = {
    name = "+CodeActions",
    l = { "<cmd>GoCodeLenAct<CR>", "GoCodeLenAct" },
    a = { "<cmd>GoCodeAction<CR>", "GoCodeAction" },
  },
  t = {
    name = "+Tag",
    m = { "<cmd>GoModifyTag<CR>", "GoModifyTag" },
    a = { "<cmd>GoAddTag<CR>", "GoAddTag" },
    r = { "<cmd>GoRmTag<CR>", "GoRmTag" },
    c = { "<cmd>GoClearTag<CR>", "GoClearTag" },
  },
  I = { "<cmd>GoImpl", "GoImpl" },
  r = { "<cmd>GoRename<CR>", "GoRename" },
  e = { "<cmd>GoIfErr<CR>", "GoIfErr" },
  F = {
    name = "+Fill",
    s = { "<cmd>GoFillStruct<CR>", "GoFillStruct" },
    w = { "<cmd>GoFillSwitch<CR>", "GoFillSwitch" },
  },
  p = { "<cmd>GoFixPlurals<CR>", "GoFixPlurals" },
  g = { "<cmd>GoGenReturn<CR>", "GoGenReturn" },
  x = { "<cmd>GoTermClose<CR>", "GoTermClose" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = "#ff7878" })
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bold = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bold = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bold = true })
    vim.api.nvim_set_hl(0, "BufferLineHintDiagnostic", { fg = "#676e7b", sp = "#676e7b", bg = "#1e2024" })
    vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { fg = "#676e7b", sp = "#676e7b", bg = "#1e2024" })
    vim.api.nvim_set_hl(0, "BufferLineInfoDiagnostic", { fg = "#676e7b", sp = "#676e7b", bg = "#1e2024" })
    vim.api.nvim_set_hl(0, "BufferLineWarningDiagnostic", { fg = "#676e7b", sp = "#676e7b", bg = "#1e2024" })
    vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { fg = "#e06c75", bg = "#1e2024" })
    vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#e06c75", bg = "#1e2024" })
  end,
  desc = "Modify color groups",
})

-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  nested = true,
  command = "if winnr('$') == 1 && (bufname() == 'NvimTree_' . tabpagenr() || bufname() == 'OUTLINE') | quit | endif",
})

-- vim.cmd('autocmd! TermOpen term://* lua require("config.utils").set_terminal_keymaps()')
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    require("utility.terminal").set_terminal_keymaps()
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#f24e4e" })
  end,
  desc = "Create highlight group for trailing whitespaces",
})

-- vim.cmd 'autocmd CmdlineEnter /,? :set hlsearch'
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "/,?",
  command = "set hlsearch",
})

-- vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "/,?",
  command = "set nohlsearch",
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertEnter" }, {
  pattern = { "*.c", "*.cpp", "*.cc", "*.h", "*.lua", "*.js" },
  command = "setlocal ts=2 sw=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

-- Additional Plugins
lvim.plugins = {
  -- main colorschemes
  {
    "folke/tokyonight.nvim",
  },
  {
    "cpea2506/one_monokai.nvim",
    pin = true,
  },
  -- more optional colorschemes
  -- {
  --     'bluz71/vim-moonfly-colors',
  --     'tiagovla/tokyodark.nvim',
  --     'titanzero/zephyrium',
  -- },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require "config.neoscroll"
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   setup = [[ require("config.indent_blankline_setup") ]],
  --   config = [[ require("config.indent_blankline") ]],
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "config.colorizer"
    end,
  },
  -- {
  --  "github/copilot.vim", -- VimScript
  -- config = [[ require("config.copilot") ]],
  -- },
  -- {
  --   "tzachar/cmp-tabnine",
  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  --   config = function()
  --     require "config.cmp_tabnine"
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require "config.hop"
    end,
  },
  {
    "ntpeters/vim-better-whitespace", -- VimScript
    after = { "which-key.nvim" },
    config = function()
      require "config.better_whitespace"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    event = "FileType rust",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
    config = function()
      require "config.rust_tools"
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require "config.neogen_annotations"
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require "config.symbols_outline"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require "config.dap_python"
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require "config.nvim_osc52"
    end,
  },
  -- { "MTDL9/vim-log-highlighting" }, -- VimScript
  { "tpope/vim-abolish" }, -- VimScript
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      require "config.go_nvim"
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  { "editorconfig/editorconfig-vim" },
}
