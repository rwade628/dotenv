return {
  keys = {
    {
      "<leader>lo",
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        }
      end,
      desc = "Organize Imports",
    },
    {
      "<leader>lR",
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        }
      end,
      desc = "Remove Unused Imports",
    },
  },
  settings = {
    typescript = {
      format = {
        indentSize = vim.o.shiftwidth,
        convertTabsToSpaces = vim.o.expandtab,
        tabSize = vim.o.tabstop,
      },
    },
    javascript = {
      format = {
        indentSize = vim.o.shiftwidth,
        convertTabsToSpaces = vim.o.expandtab,
        tabSize = vim.o.tabstop,
      },
    },
    completions = {
      completeFunctionCalls = true,
    },
  },
}
