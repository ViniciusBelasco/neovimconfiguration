return {
	"christoomey/vim-tmux-navigator",
	-- tmux pane Navigation
	vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>"), -- Navigate Left
	vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>"), -- Navigate Down
	vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>"), -- Navigate UP
	vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>"), -- Navigate Right
}
