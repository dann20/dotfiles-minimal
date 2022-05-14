local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup({
	show_current_context = true,
    filetype_exclude = { "packer", "lspinfo", "checkhealth", "help", "man", "lsp-installer", "alpha" },
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
	-- show_current_context_start = true,
	-- char_highlight_list = {
	--     "IndentBlanklineIndent1",
	--     "IndentBlanklineIndent2",
	-- },
})