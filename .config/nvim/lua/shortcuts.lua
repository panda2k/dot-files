function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-k>", ":GFiles<CR>", { silent = true })
map("n", "<C-v>", ":bnext<CR>", { silent = true })
map("n", "<C-c>", ":bprev<CR>", { silent = true })
map("n", "<C-x>", ":bd<CR>", { silent = true })
map("n", "<C-l>", ":Rg<CR>", { silent = true})
map("n", "<C-j>", ":Trouble diagnostics toggle focus=true filter.buf=0<CR>", { silent = true })
map("n", "<M>", ":bnext<CR>")
map("n", "<N>", ":bprevious<CR>")

