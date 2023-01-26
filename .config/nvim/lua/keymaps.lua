local function map(mode, lhs, rhs, opts)
   local options = { noremap = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

map("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { silent = true })

-- Better pane/buffer navigation

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

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

-- Trouble
map("n", "<leader>tt", ":TroubleToggle<CR>")

-- Quick Packer
map("n", "<leader>ps", ":PackerSync<CR>")
map("n", "<leader>pc", ":PackerCompile<CR>")

-- Terminal
map("t", "<ESC>", "<C-\\><C-n>")
map("t", "<C-[>", "<C-\\><C-n>")

-- fuGITive
map("n", "<leader>gp", ":G push<cr>")
map("n", "<leader>gs", ":G status<cr>")
map("n", "<leader>gd", ":G diff<cr>")
map("n", "<leader>gpf", ":G push -f<cr>")
map("n", "<leader>gc", ":G commit<cr>")
map("n", "<leader>gca", ":G commit -a --amend<cr>")
