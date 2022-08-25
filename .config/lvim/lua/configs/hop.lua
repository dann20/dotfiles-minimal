local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

local status_ok_hint, hint = pcall(require, "hop.hint")
if not status_ok_hint then
	return
end

hop.setup({})

local mode = {'n', 'v'}

vim.keymap.set(mode, 'f', function() hop.hint_char1({ current_line_only = true }) end)
vim.keymap.set(mode, 'q', hop.hint_char2)
vim.keymap.set(mode, ',w', hop.hint_words)
vim.keymap.set(mode, ',L', hop.hint_lines)
vim.keymap.set(mode, ',j', function() hop.hint_lines({ direction = hint.HintDirection.AFTER_CURSOR }) end)
vim.keymap.set(mode, ',k', function() hop.hint_lines({ direction = hint.HintDirection.BEFORE_CURSOR }) end)
vim.keymap.set(mode, ',l', function() hop.hint_words({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true, hint_position = hint.HintPosition.END }) end)
vim.keymap.set(mode, ',h', function() hop.hint_words({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_position = hint.HintPosition.END }) end)
vim.keymap.set(mode, ',/', hop.hint_patterns)
vim.keymap.set(mode, ',,/', function() hop.hint_patterns({ direction = hint.HintDirection.AFTER_CURSOR }) end)
vim.keymap.set(mode, ',,?', function() hop.hint_patterns({ direction = hint.HintDirection.BEFORE_CURSOR }) end)
