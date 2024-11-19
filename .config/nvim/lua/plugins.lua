local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'wakatime/vim-wakatime',
    {
        'svrana/neosolarized.nvim',
        dependencies = { 'tjdevries/colorbuddy.nvim' }
    },
    'L3MON4D3/LuaSnip', -- snippets for cmp
    'onsails/lspkind-nvim', -- vscode like pictograms for autocomplete
    'hrsh7th/cmp-buffer', -- source for buiffer words
    'hrsh7th/cmp-nvim-lsp', -- autcomplete source for native lsp
    'hrsh7th/cmp-nvim-lsp-signature-help', -- method signature help
    'hrsh7th/nvim-cmp', -- autocompletion
    'neovim/nvim-lspconfig', -- LSP
    'windwp/nvim-ts-autotag', -- auto close html tags
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'airblade/vim-gitgutter',
    'mfussenegger/nvim-jdtls',
    {
        "junegunn/fzf.vim",
        dependencies = {
            "junegunn/fzf", build = ":call fzf#install()"
        }
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        dependencies = "kyazdani42/nvim-web-devicons",
    },
    'lervag/vimtex',
    'vim-airline/vim-airline',
    'tpope/vim-fugitive',
})
