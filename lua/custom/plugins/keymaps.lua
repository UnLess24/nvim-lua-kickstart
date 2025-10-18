return {
	vim.api.nvim_set_keymap('', 'gd', "<C-]>", { desc = '[G]oto [D]efinition', noremap = true }),
	vim.api.nvim_set_keymap('', 'gD', "<C-w><C-]>", { desc = '[G]oto [D]eclaration', noremap = true }),

	vim.api.nvim_set_keymap('', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
		{ desc = '[D]ocument [S]ymbols', noremap = true }),
	vim.api.nvim_set_keymap('', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
		{ desc = '[W]orkspace [S]ymbols', noremap = true }),

	-- See `:help K` for why this keymap
	vim.api.nvim_set_keymap('', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = 'Hover Documentation', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ desc = 'Signature Documentation', noremap = true }),

	-- Highlight current word
	vim.api.nvim_set_keymap('', '<leader>*', "*N", { desc = 'Highlight current word', noremap = true }),

	-- Set cursor move between windows to arrow keys
	vim.api.nvim_set_keymap('', '<Up>', '<C-w>k', { desc = 'Cursor to Up window', noremap = true }),
	vim.api.nvim_set_keymap('', '<Down>', '<C-w>j', { desc = 'Cursor to Dows window', noremap = true }),
	vim.api.nvim_set_keymap('', '<Left>', '<C-w>h', { desc = 'Cursor to Left window', noremap = true }),
	vim.api.nvim_set_keymap('', '<Right>', '<C-w>l', { desc = 'Cursor to Right window', noremap = true }),

	-- Set change windows size to countrol and arrow keys
	vim.api.nvim_set_keymap('', '<leader><Up>', '<C-w>+', { desc = 'Increase window size', noremap = true }),
	vim.api.nvim_set_keymap('', '<leader><Down>', '<C-w>-', { desc = 'Decrease window size', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-Left>', '<C-w>>', { desc = 'Increase window width', noremap = true }),
	vim.api.nvim_set_keymap('', '<C-Right>', '<C-w><', { desc = 'Decrease window width', noremap = true }),

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

	-- Set keymaps for git merge
	vim.api.nvim_set_keymap('n', '<leader>hmt', "<cmd>Gvdiffsplit!<CR>",
		{ desc = '[G]it [M]erge [T]ool', noremap = true }),
	vim.api.nvim_set_keymap('n', '<leader>hh', "",
		{
			desc = '[G]it merge use left',
			noremap = true,
			callback = function()
				if vim.opt.diff:get() then
					vim.cmd("diffget //2")
				end
			end,
		}),
	vim.api.nvim_set_keymap('n', '<leader>hl', "",
		{
			desc = '[G]it merge use right',
			noremap = true,
			callback = function()
				if vim.opt.diff:get() then
					vim.cmd("diffget //3")
				end
			end,
		}),
}
