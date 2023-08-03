local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  -- commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      -- commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
      lazy = true,
    },
  },
}

function M.config()
  local null_ls = require "null-ls"
  local codeactions = null_ls.builtins.code_actions
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      -- ### Code Actions
      codeactions.gomodifytags,
      -- #### Formatting
      formatting.prettier.with {
        extra_filetypes = { "toml" },
      },
      formatting.stylua,
      formatting.google_java_format,
      formatting.gofumpt,
      formatting.goimports_reviser.with({
        extra_args = { "-use-cache" },
      }),
      formatting.terraform_fmt,
      -- ### Diagnostics
      diagnostics.actionlint,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
            -- vim.lsp.buf.formatting_sync()
            -- vim.lsp.buf.format { async = false }
          end,
        })
      end
    end,
  }
end

return M
