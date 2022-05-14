--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- imports
local func = require("configs.utils")

-- vim general
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.go.cmdheight = 1
vim.go.showmode = true
vim.go.termguicolors = true
vim.opt.shell = "/bin/sh"

-- LunarVim general
lvim.log.level = "warn"
lvim.format_on_save = false
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
for _, v in ipairs(unmap_keys) do
    vim.keymap.set("n", v, "")
end

-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.keymap.set("n", "<M-l>", "<C-W>l")
vim.keymap.set("n", "<M-h>", "<C-W>h")
vim.keymap.set("n", "<M-j>", "<C-W>j")
vim.keymap.set("n", "<M-k>", "<C-W>k")

-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- copilot configs
vim.keymap.set("i", "<C-L>", 'copilot#Accept("")', { expr = true, silent = true, script = true })
vim.g.copilot_no_tab_map = true

-- autopairs config
lvim.builtin.autopairs.enable_check_bracket_line = true

-- harpoon configs
vim.keymap.set("n", ",1", function() require("harpoon.ui").nav_file(1) end, { silent = true })
vim.keymap.set("n", ",2", function() require("harpoon.ui").nav_file(2) end, { silent = true })
vim.keymap.set("n", ",3", function() require("harpoon.ui").nav_file(3) end, { silent = true })
vim.keymap.set("n", ",4", function() require("harpoon.ui").nav_file(4) end, { silent = true })
vim.keymap.set("n", ",5", function() require("harpoon.ui").nav_file(5) end, { silent = true })
vim.keymap.set("n", ",6", function() require("harpoon.ui").nav_file(6) end, { silent = true })
vim.keymap.set("n", ",7", function() require("harpoon.ui").nav_file(7) end, { silent = true })
vim.keymap.set("n", ",8", function() require("harpoon.ui").nav_file(8) end, { silent = true })
vim.keymap.set("n", ",9", function() require("harpoon.ui").nav_file(9) end, { silent = true })
vim.keymap.set("n", ",n", function() require("harpoon.ui").nav_next() end, { silent = true })
vim.keymap.set("n", ",p", function() require("harpoon.ui").nav_prev() end, { silent = true })

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
lvim.builtin.which_key.mappings["z"] = { func.strip_trailing_spaces, "Clear Trailing Spaces" }
lvim.builtin.which_key.mappings["a"] = { "<cmd>vertical Copilot<cr>", "Copilot" }
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
lvim.builtin.which_key.mappings["m"] = { require("harpoon.mark").add_file, "Mark file" }
lvim.builtin.which_key.mappings["H"] = {
	name = "+Harpoon",
	m = { require("harpoon.ui").toggle_quick_menu, "Modify mark list" },
	s = { "<cmd>Telescope harpoon marks<cr>", "Show all marks" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "/usr/bin/fish"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.bufferline.options.offsets[2].highlight = false
-- lvim.builtin.lualine.options.globalstatus = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
    "fish",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow = {
	enable = true,
	-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	-- colors = {}, -- table of hex strings
	-- termcolors = {} -- table of colour name strings
}

-- generic LSP settings
lvim.lsp.diagnostics.virtual_text = false

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "stylua", filetypes = { "lua" } },
	--   { command = "isort", filetypes = { "python" } },
	--   {
	--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "prettier",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--print-with", "100" },
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "typescript", "typescriptreact" },
	--   },
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	--   {
	--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "shellcheck",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--severity", "warning" },
	--   },
	--   {
	--     command = "codespell",
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "javascript", "python" },
	--   },
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.rainbow_colors = {
-- 	{ "ColorScheme", "*", "highlight rainbowcol1 guifg=#ff7878" },
-- }
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function() vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "#ff7878" }) end,
    desc = "Modify rainbow colors",
})

-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    nested = true,
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
})

-- vim.cmd('autocmd! TermOpen term://* lua require("configs.utils").set_terminal_keymaps()')
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function() require("configs.utils").set_terminal_keymaps() end
})

-- vim.cmd [[
--     autocmd ColorScheme * highlight ExtraWhitespace guibg=#f24e4e
--     autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
--     autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
--     autocmd InsertLeave * match ExtraWhitespace /\s\+$/
--     autocmd BufWinLeave * call clearmatches()
-- ]]
local id_grp_trailing_spaces = vim.api.nvim_create_augroup("TrailingSpaces", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    group = id_grp_trailing_spaces,
    callback = function() vim.api.nvim_set_hl(0, "TrailingWhitespaces", { bg = "#f24e4e" }) end,
    desc = "Create highlight group for trailing whitespaces",
})
vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
    pattern = "*",
    group = id_grp_trailing_spaces,
    command = "match TrailingWhitespaces /\\s\\+$/",
})
vim.api.nvim_create_autocmd("InsertEnter" , {
    pattern = "*",
    group = id_grp_trailing_spaces,
    command = "match TrailingWhitespaces /\\s\\+\\%#\\@<!$/",
})
vim.api.nvim_create_autocmd({ "BufWinLeave", "FileType alpha" }, {
    pattern = "*",
    group = id_grp_trailing_spaces,
    callback = "clearmatches",
})

-- Additional Plugins
lvim.plugins = {
	-- main colorschemes
	{
		"folke/tokyonight.nvim",
		"cpea2506/one_monokai.nvim",
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
		config = [[ require("configs.neoscroll") ]],
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = [[ require("configs.indent_blankline_setup") ]],
		config = [[ require("configs.indent_blankline") ]],
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = [[ require("configs.colorizer") ]],
	},
	{
		"github/copilot.vim",
	},
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = [[ require("configs.cmp_tabnine") ]],
	},
	{
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = [[ require("configs.harpoon") ]],
	},
    {
        "tpope/vim-surround",
    },
}