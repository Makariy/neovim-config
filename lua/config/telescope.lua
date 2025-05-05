return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		function open_in_background_tab(prompt_bufnr)
			require("telescope.actions").select_tab(prompt_bufnr)
			vim.cmd(":tabprev")
			vim.cmd(":Telescope resume")
		end	 

		telescope.setup({
			defaults = {
    			mappings = {
      	  	  	  i = { -- insert mode
        			["<C-t>"] = open_in_background_tab
        		  },
      	  	  	  n = { -- normal mode 
        			["<C-t>"] = open_in_background_tab
      	  	  	  }
    			}
  	  	  	}
		})
	end,
}

