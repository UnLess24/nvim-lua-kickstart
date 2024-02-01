return {
	-- Set jk to hit esc key
	vim.api.nvim_set_keymap('i', 'jk', "<esc>", { desc = 'Alias to ESC key for edit', noremap = true }),

	vim.api.nvim_set_keymap('', '+', "<C-a>", { desc = 'increment' }),
	vim.api.nvim_set_keymap('', '-', "<C-x>", { desc = 'decrement' }),

	vim.api.nvim_set_keymap('n', "<C-a>", 'ggVG', { desc = 'Select all', noremap = true }),
}
