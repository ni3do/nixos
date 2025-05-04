return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>fn",
			function()
				require("fzf-lua").files({ cwd = "~/repos/second-brain" })
			end,
			desc = "Find in Notes",
		},
	},
}
