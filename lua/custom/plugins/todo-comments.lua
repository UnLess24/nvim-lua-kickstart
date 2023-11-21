return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		vim.keymap.set("n", "<leader>t", '<cmd>TodoTelescope<cr>', { desc = "TODO list (Telescope)" }),
	}
}
