return {
	-- Set jk to hit esc key
	vim.api.nvim_set_keymap('i', 'jk', "<esc>", { desc = 'Alias to ESC key for edit', noremap = true }),

	-- Ser=t increment/decrement keys
	vim.api.nvim_set_keymap('', '+', "<C-a>", { desc = 'increment', noremap = true }),
	vim.api.nvim_set_keymap('', '-', "<C-x>", { desc = 'decrement', noremap = true }),

	vim.api.nvim_set_keymap('n', "<C-a>", 'ggVG', { desc = 'Select all', noremap = true }),

	-- Set cursor move between windows to arrow keys
	vim.api.nvim_set_keymap('', '<Up>', '<C-w>k', { desc = 'Cursor to Up wondow', noremap = true }),
	vim.api.nvim_set_keymap('', '<Down>', '<C-w>j', { desc = 'Cursor to Dows window', noremap = true }),
	vim.api.nvim_set_keymap('', '<Left>', '<C-w>h', { desc = 'Cursor to Left window', noremap = true }),
	vim.api.nvim_set_keymap('', '<Right>', '<C-w>l', { desc = 'Cursor to Right window', noremap = true }),

	-- Set change windows size to countrol and arrow keys
	vim.api.nvim_set_keymap('', '<C-Up>', '<C-w>+', { desc = 'Increase window size', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-Down>', '<C-w>-', { desc = 'Decrease window size', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-Left>', '<C-w>>', { desc = 'Increase window width', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-Right>', '<C-w><', { desc = 'Decrease window width', noremap = true }),

	-- Set terminal keys
	vim.api.nvim_set_keymap('n', '<leader>ter', '<cmd>ToggleTerm 1<CR>',
		{ desc = 'Enter to Terminal 1 normal mode', noremap = true }),
	vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', { desc = 'Terminal normal mode', noremap = true }),

	-- Set LSP keys
	vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>LspRestart<CR>', { desc = '[L]SP [R]estart', noremap = true }),

	-- Set AI keys
	vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>CodeiumEnable<CR>',
		{ desc = '[C]odeium [E]nable', noremap = true }),
	vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>CodeiumDisable<CR>',
		{ desc = '[C]odeium [D]isable', noremap = true }),

	-- Set keymaps for Telescope quickfix
	vim.api.nvim_set_keymap('n', '<leader>tq', '<cmd>Telescope quickfix<CR>',
		{ desc = '[T]elescope [Q]uickfix', noremap = true }),
	vim.api.nvim_set_keymap('n', '<leader>tqh', '<cmd>Telescope quickfixhistory<CR>',
		{ desc = '[T]elescope [Q]uickfix [H]istory', noremap = true }),
}
