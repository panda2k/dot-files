local status, nvim_lsp = pcall(require, "lspconfig")
local configs = require("lspconfig.configs")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
        })
    end
end

nvim_lsp.tailwindcss.setup{}

-- TypeScript
nvim_lsp.ts_ls.setup {
    on_attach = on_attach,
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.pyright.setup{}
nvim_lsp.vuels.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.ccls.setup{}
nvim_lsp.ocamllsp.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.zls.setup{}

-- Elixir Lexical
--[[local lexical_config = {
  filetypes = { "elixir", "eelixir", "heex" },
  cmd = { "/Users/michael/Programming/Tools/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
  settings = {},
}

if not configs.lexical then
  configs.lexical = {
    default_config = {
      filetypes = lexical_config.filetypes,
      cmd = lexical_config.cmd,
      root_dir = function(fname)
        return nvim_lsp.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
      -- optional settings
      settings = lexical_config.settings,
    },
  }
end

nvim_lsp.lexical.setup({})--]]

