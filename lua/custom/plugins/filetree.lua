-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require('neo-tree').setup {
			event_handlers = {
				{
					event = "file_opened",
					handler = function(_)
						require('neo-tree.command').execute { action = 'close' }
					end,
				}
			}
		}
	end,
	vim.api.nvim_set_keymap('', '<leader>nt', "<cmd>Neotree position=right<CR>", { desc = 'Open [Neo][T]ree' }),
	vim.api.nvim_set_keymap('', '<leader>ns', "<cmd>Neotree float git_status<CR>",
		{ desc = 'Open [NeoTree] Git[s]tatus' }),
	vim.api.nvim_set_keymap('', '<leader>nf', "<cmd>Neotree float<CR>",
		{ desc = 'Open [NeoTree] [f]loat' }),
	vim.api.nvim_set_keymap('', '<leader>nb', "<cmd>Neotree float buffers<CR>",
		{ desc = 'Open [NeoTree] float [b]uffers]' }),
}
