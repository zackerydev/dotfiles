local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- CTRL + hjkl split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Neotree
map("n", "<leader>o", ":Neotree toggle=true<cr>", { silent = true })
map("n", "<leader>b", ":Neotree toggle=true buffers<CR>", { silent = true })
map("n", "<leader>g", ":Neotree toggle=true git_status<CR>", { silent = true })

-- Tab, open buffer navigation
map("n", "<Tab>", ":bnext<cr>")
map("n", "<S-Tab>", ":bprevious<cr>")

-- Telescope

map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fw", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>jj", ":Telescope buffers<cr>")
map("n", "<leader>ll", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<leader>fr", ":Telescope resume<cr>")

-- LSP
-- Trouble
map("n", "<leader>tt", ":TroubleToggle<CR>")

-- fuGITive
map("n", "<leader>gp", ":G push<cr>")
map("n", "<leader>gs", ":G status<cr>")
map("n", "<leader>gd", ":G diff<cr>")
map("n", "<leader>gpf", ":G push -f<cr>")
map("n", "<leader>gc", ":G commit<cr>")
map("n", "<leader>gca", ":G commit -a --amend<cr>")

-- Folding
map("n", "<leader>c", "za")
map("v", "<leader>c", "za")

map("n", "<leader>l", "za")
map("v", "<leader>l", "zc")

map("n", "<leader>O", "zM")
map("v", "<leader>O", "zM")

map("n", "<leader>L", "zR")
map("v", "<leader>L", "zR")
