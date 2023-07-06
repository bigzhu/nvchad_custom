local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local present, flutter_tools = pcall(require, "flutter-tools")
if not present then
  return
end

flutter_tools.setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
require("lspconfig").dartls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
return {}
