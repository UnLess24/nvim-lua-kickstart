return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.g.codeium_disable_bindings = 1
		-- vim.g.codeium_enabled = 0
		vim.g.codeium_manual = 1

		vim.keymap.set('i', '<C-q><tab>', function() return vim.fn['codeium#Accept']() end,
			{ desc = 'Accept', expr = true, noremap = true })
		vim.keymap.set('i', '<C-q>c', function() return vim.fn['codeium#Complete']() end,
			{ desc = 'Do suggestion', expr = true, noremap = true })
		vim.keymap.set('i', '<C-q>j', function() return vim.fn['codeium#CycleCompletions'](1) end,
			{ desc = 'Next suggestion', expr = true, noremap = true })
		vim.keymap.set('i', '<C-q>k', function() return vim.fn['codeium#CycleCompletions'](-1) end,
			{ desc = 'Previous suggestion', expr = true, noremap = true })
		-- vim.keymap.set('i', '<C-q><space>', function() return vim.fn['codeium#Clear']() end,
		-- 	{ desc = 'continue without suggestion', expr = true, noremap = true })
	end,
}
