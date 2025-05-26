
return {
	"Pocco81/auto-save.nvim",
	config = function() 
		require("auto-save").setup({
  	  	  trigger_events = {"InsertLeave", "TextChanged"}, -- not on every keystroke
  	  	  debounce_delay = 2000, -- wait 2s before saving
  	  	  condition = function(buf)
    		return vim.bo.filetype ~= "undotree" -- don't save undotree
  	  	  end,
		})
	end 
}

