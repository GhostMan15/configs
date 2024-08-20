local augroup = vim.api.nvim_create_augroup("LspFromatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function (clinet, bufnr)
    if clinet.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
    end
  end,
}
return opts
