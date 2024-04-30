return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		local db = require('dashboard')
		-- local ascii = require("ascii")
		db.setup({
			theme = 'hyper',
			config = {
				-- header = ascii.get_random_global(),
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{ icon = '', desc = 'Quit', action = 'q', key = 'q' },
				},
			},
		})
	end,
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'MaximilianLloyd/ascii.nvim' }
	}
}

