local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
   if server.name == "sumneko_lua" then
     opts = {
       settings = {
         Lua = {
           diagnostics = {
             globals = { 'vim', 'use' }
           },
           --workspace = {
             -- Make the server aware of Neovim runtime files
             --library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
           --}
         }
       }
     }
   end

   if server.name == "emmet_ls" then
     opts.filetypes = {"html", "css", "blade", "typescriptreact", "php"}
   end
   if server.name == "html" then
     opts.filetypes = {"html", "typescriptreact"}
   end
   if server.name == "eslint" then
      opts.filetypes = {"javascript"}
   end
   if server.name == "tsserver" then
   	opts.filetypes = {"javascript", "typescript"}
   end
   if server.name == "pyright" then
	opts.filetypes = {"python"}
   end

   -- opts.on_attach = on_attach

  server:setup(opts)
  -- server:setup({capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())})
  -- vim.cmd [[ do User LspAttachBuffers ]]
end)

