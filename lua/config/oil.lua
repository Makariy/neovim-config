
return {
  	"stevearc/oil.nvim",
  	dependencies = { "nvim-tree/nvim-web-devicons" },
  	config = function()
    	require("oil").setup({
      		default_file_explorer = true,

      		win_options = {
    			-- spell = true,
      		},

      		lsp_file_methods = {
        		timeout_ms = 2000,
        		autosave_changes = true,
      		},

      		view_options = {
        		show_hidden = true,
      		},
    	})
  	end,
}
