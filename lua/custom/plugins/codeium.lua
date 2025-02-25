return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.g.codeium_disable_bindings = 1
		vim.g.codeium_enabled = 1
		-- vim.g.codeium_manual = 1

		vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#Accept']() end,
			{ desc = 'Accept', expr = true, noremap = true })
	end,
}
