return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.g.codeium_disable_bindings = 1
		vim.g.codeium_enabled = 0

		vim.keymap.set('i', '<C-/><tab>', function() return vim.fn['codeium#Accept']() end,
			{ desc = 'Codeium: Accept', expr = true, noremap = true })
		vim.keymap.set('i', '<C-/>j', function() return vim.fn['codeium#CycleCompletions'](1) end,
			{ desc = 'Codeium: Next suggestion', expr = true, noremap = true })
		vim.keymap.set('i', '<C-/>k', function() return vim.fn['codeium#CycleCompletions'](-1) end,
			{ desc = 'Codeium: Previous suggestion', expr = true, noremap = true })
		vim.keymap.set('i', '<C-/><space>', function() return vim.fn['codeium#Clear']() end,
			{ desc = 'Codeium: continue without suggestion', expr = true, noremap = true })
	end,
}
