local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

 

lspconfig.omnisharp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"dotnet",  "/home/faruk/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_editorconfig_support = true,
  enable_import_completion = true,
  sdk_inculde_prereleases = true,
  enable_roslyn_analyzers = true,

}

lspconfig.emmet_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"css","eruby","html","javascript","less","sass","vue","scss","pug","svelte","typescriptreact"},
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}


lspconfig.phpactor.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function (fname)
    return lspconfig.util.root_pattern('composer.json','.git')(fname) or vim.loop.os_homedir()
    
  end,
}

lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go","gomod","gowork","gotmpl"},
  root_dir = util.root_pattern("go.work","go.mod",".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities =capabilities,
    init_options = {
    preferences ={
      disableSuggestions = true,
    },
  },
}
  lspconfig.clangd.setup{
   on_attach = function (client,bufnr)
      client.server_capabilities.signatureHelpProvider = false
      on_attach(client, bufnr)
  end,
    capabilities = capabilities,
  }

