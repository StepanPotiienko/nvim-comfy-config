local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    python = { "black", "isort" },
    c_cpp = { "clang-format" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  formatters = {
      ["goimports-reviser"] = {
          prepend_args = { "-rm-unused" },
      },
      golines = {
          prepend_args = { "--max-len=80" },
      },
    },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
