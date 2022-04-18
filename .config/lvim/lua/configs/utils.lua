local M = {}

function M.strip_trailing_spaces()
	local excluded_ft = { "ruby", "markdown", "perl" }
	local ft = vim.bo.filetype
	for _, value in ipairs(excluded_ft) do
		if ft == value then
			return
		end
	end
	vim.cmd([[ %s/\s\+$//e ]])
end

function M.set_terminal_keymaps()
	-- for ToggleTerm
	local opts = { noremap = true }
	local unmap_keys = {
		"<C-k>",
		"<C-h>",
		"<C-j>",
		"<C-l>",
	}
	for _, v in ipairs(unmap_keys) do
		vim.api.nvim_buf_set_keymap(0, "t", v, "", opts)
	end
	vim.api.nvim_buf_set_keymap(0, "t", "<C-[><C-[>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<M-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<M-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<M-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<M-l>", [[<C-\><C-n><C-W>l]], opts)
end

return M
