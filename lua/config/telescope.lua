
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local state = require('telescope.actions.state')
		local harpoon_mark = require("harpoon.mark")

		function open_in_background_tab(prompt_bufnr)
			local filename = state.get_current_picker(prompt_bufnr).all_previewers[1].state.bufname
			vim.print(filename)
			harpoon_mark.add_file(filename)
			-- require("telescope.actions").select_tab(prompt_bufnr)
			-- vim.cmd(":tabprev")
			-- vim.cmd(":Telescope resume")
		end	 

		telescope.setup({
			defaults = {
    			mappings = {
      	  	  	  i = { -- insert mode
        			["<A-m>"] = open_in_background_tab
        		  },
      	  	  	  n = { -- normal mode 
        			["<A-m>"] = open_in_background_tab
      	  	  	  }
    			}
  	  	  	}
		})
	end,
}

