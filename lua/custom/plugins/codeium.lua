return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.g.codeium_disable_bindings = 1

		vim.keymap.set('i', '<leader><tab>', function() return vim.fn['codeium#Accept']() end,
			{ desc = 'Codeium: Accept', expr = true })
		vim.keymap.set('i', '<leader><C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end,
			{ desc = 'Codeium: Next suggestion', expr = true })
		vim.keymap.set('i', '<leader><C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
			{ desc = 'Codeium: Previous suggestion', expr = true })
		vim.keymap.set('i', '<leader><C-x>', function() return vim.fn['codeium#Clear']() end,
			{ desc = 'Codeium: Clear suggestion', expr = true })
	end,
}
