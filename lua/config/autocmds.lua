return {
	-- Git
	-- :command <AliasName> <string of command to be aliased>
	-- require 'tpope/vim-fugitive'
	vim.api.nvim_create_user_command('Gc', 'Git commit --verbose', {}),
	vim.api.nvim_create_user_command('Gd', 'Git diff', {}),
	vim.api.nvim_create_user_command('Gds', 'Git diff --staged', {}),
	vim.api.nvim_create_user_command('Gdca', 'Git diff --cached', {}),
	vim.api.nvim_create_user_command('Gdcw', 'Git diff --cached --word-diff', {}),
}
