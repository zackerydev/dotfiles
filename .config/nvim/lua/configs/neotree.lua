require("neo-tree").setup({
	close_if_last_window = false,
	enable_git_status = true,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = true,
		},
		follow_current_file = {
			enabled = true,
		},
	},
})
