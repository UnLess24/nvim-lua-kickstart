return {
	-- Set jk to hit esc key
	vim.api.nvim_set_keymap('i', 'jk', "<esc>", { desc = 'Alias to ESC key for edit', noremap = true }),
}
