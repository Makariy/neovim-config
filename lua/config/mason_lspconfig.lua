
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    if msg:match("position_encoding param is required in vim.lsp.util.make_position_params.") then
        return
    end

    notify(msg, ...)
end


return {
	"mason-org/mason-lspconfig.nvim",
	config = function() 
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local mason_lsp_config = require("mason-lspconfig")

		mason_lsp_config.setup({})

		vim.lsp.config('*', {
  			capabilities = capabilities,
		})
		vim.lsp.config('pyrefly', {
  			settings = {
    			python = {
    				pyrefly = {
      					displayTypeErrors = "force-on",
    				}
    			}
  			},
		})
		vim.lsp.enable({"pyrefly", "ruff", "gopls", "cspell_ls"})
	end
}

