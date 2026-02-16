return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		local db = require('dashboard')
		-- local ascii = require("ascii")
		db.setup({
			theme = 'doom',
			config = {
				-- header = { "test " }, --your header
				center = {
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'Find File',
						desc_hl = 'String',
						key = 'ff',
						keymap = '<leader>ff',
						key_hl = 'Number',
						-- key_format = ' %s', -- remove default surrounding `[]`
						action = 'FzfLua files'
					},
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'NeoTree (float)',
						desc_hl = 'String',
						key = 'nf',
						keymap = '<leader>nf',
						key_hl = 'Number',
						-- key_format = ' %s', -- remove default surrounding `[]`
						action = 'Neotree float'
					},
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'Git status',
						desc_hl = 'String',
						key = 'gs',
						keymap = '<leader>gs',
						key_hl = 'Number',
						-- key_format = ' %s', -- remove default surrounding `[]`
						action = 'FzfLua git_status'
					},
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'TODO',
						desc_hl = 'String',
						key = 'xt',
						keymap = '<leader>xt',
						key_hl = 'Number',
						-- key_format = ' %s', -- remove default surrounding `[]`
						action = 'Trouble todo filter = {tag = {YAK,DONE}}'
					},
				},
				footer = {}, --your footer
				vertical_center = true,
			}
		})
	end,
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons' },
		-- { 'MaximilianLloyd/ascii.nvim' }
	}
}
