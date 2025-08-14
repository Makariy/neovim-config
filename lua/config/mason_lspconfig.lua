
return {
	"mason-org/mason-lspconfig.nvim",
	config = function() 
		require("mason-lspconfig").setup({
  			ensure_installed = {
  				"pyrefly",  -- Finally!!!
				"ruff",
  				"gopls",
  			},
  			-- automatic_enable = {
     --    		exclude = {
     --        		"ruff"
     --    		}
    	-- 	}
		})
	end
}

