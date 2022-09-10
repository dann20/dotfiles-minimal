--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- For updated configs, refer to LunarVim documentation and
-- ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua

-- imports
local func = require("configs.utils")
-- local notify = require("notify")
-- local completion = require("cmp")

-- vim general
vim.go.showmode = true
vim.go.termguicolors = true
vim.go.scrolloff = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.shell = "/bin/sh"
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.iskeyword:remove({ "_" })

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
local unmap_modes = { "n", "t" }
for _, key in ipairs(unmap_keys) do
	-- set keymaps to empty strings and then delete them
	-- to avoid stupid warnings of "no such mappings"
	vim.keymap.set(unmap_modes, key, "")
	vim.keymap.del(unmap_modes, key)
end
vim.keymap.del("i", "jk")
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

-- harpoon configs
vim.keymap.set("n", ",1", function()
	require("harpoon.ui").nav_file(1)
end, { silent = true })
vim.keymap.set("n", ",2", function()
	require("harpoon.ui").nav_file(2)
end, { silent = true })
vim.keymap.set("n", ",3", function()
	require("harpoon.ui").nav_file(3)
end, { silent = true })
vim.keymap.set("n", ",4", function()
	require("harpoon.ui").nav_file(4)
end, { silent = true })
vim.keymap.set("n", ",5", function()
	require("harpoon.ui").nav_file(5)
end, { silent = true })
vim.keymap.set("n", ",6", function()
	require("harpoon.ui").nav_file(6)
end, { silent = true })
vim.keymap.set("n", ",7", function()
	require("harpoon.ui").nav_file(7)
end, { silent = true })
vim.keymap.set("n", ",8", function()
	require("harpoon.ui").nav_file(8)
end, { silent = true })
vim.keymap.set("n", ",9", function()
	require("harpoon.ui").nav_file(9)
end, { silent = true })
vim.keymap.set("n", ",n", function()
	require("harpoon.ui").nav_next()
end, { silent = true })
vim.keymap.set("n", ",p", function()
	require("harpoon.ui").nav_prev()
end, { silent = true })

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
lvim.builtin.which_key.mappings["m"] = { require("harpoon.mark").add_file, "Mark file" }
lvim.builtin.which_key.mappings["H"] = {
	name = "+Harpoon",
	m = { require("harpoon.ui").toggle_quick_menu, "Modify mark list" },
	s = { "<cmd>Telescope harpoon marks<cr>", "Show all marks" },
}
lvim.builtin.which_key.mappings["n"] = {
	name = "+Annotations",
	f = { "<cmd>lua require('neogen').generate()<CR>", "Function" },
	c = { "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", "Class" },
	t = { "<cmd>lua require('neogen').generate({ type = 'type' })<CR>", "Type" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "/usr/bin/fish"
lvim.builtin.terminal.open_mapping = "<c-_>" -- remap to <C-/>
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.bufferline.options.offsets[2].highlight = false
lvim.builtin.bufferline.highlights.tab_selected = { guifg = "#ebf1fa" }
lvim.builtin.dap.active = true

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
	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	-- colors = {}, -- table of hex strings
	-- termcolors = {} -- table of colour name strings
}

-- generic LSP settings
lvim.lsp.diagnostics.virtual_text = false

---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "rust_analyzer" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "rustfmt", filetypes = { "rust" } },
	{
		command = "clang-format",
		extra_args = { "--style", "Google" },
		filetypes = { "c", "cpp", "cs", "java" },
	},
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
	{ command = "mypy", filetypes = { "python" } },
	{ command = "cppcheck", filetypes = { "c", "cpp" } },
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
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "#ff7878" })
	end,
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
	callback = function()
		func.set_terminal_keymaps()
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

vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*.c", "*.cpp", "*.cc", "*.h" },
	command = "setlocal ts=2 sw=2",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})

-- Additional Plugins
lvim.plugins = {
	-- main colorschemes
	{
		"folke/tokyonight.nvim",
	},
	{
		"cpea2506/one_monokai.nvim",
		commit = "c65e6a6faf47f8d743f601a02e237d8f431f5998",
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
	-- {
	-- 	"github/copilot.vim", -- VimScript
	-- config = [[ require("configs.copilot") ]],
	-- },
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
		"tpope/vim-surround", -- VimScript
	},
	{
		"phaazon/hop.nvim",
		config = [[ require("configs.hop") ]],
	},
	{
		"ntpeters/vim-better-whitespace", -- VimScript
		after = { "which-key.nvim" },
		config = [[ require("configs.better_whitespace") ]],
	},
	{
		"simrat39/rust-tools.nvim",
		event = "FileType rust",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
		config = [[ require("configs.rust_tools") ]],
	},
	{
		"abecodes/tabout.nvim",
		requires = { "nvim-treesitter" },
		after = { "nvim-cmp" },
		config = [[ require("configs.tabout") ]],
	},
	{
		"danymat/neogen",
		config = [[ require("configs.neogen") ]],
		requires = "nvim-treesitter/nvim-treesitter",
		tag = "*",
	},
}
