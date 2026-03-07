
return {
	"Pocco81/auto-save.nvim",

  	opts = {
  	  	trigger_events = {"InsertLeave", "TextChanged"}, -- not on every keystroke
  	  	debounce_delay = 2000, -- wait 2s before saving
    	condition = function(buf)
      		if vim.bo[buf].filetype == "oil" then
        		return false
      		end
    		return vim.bo.filetype ~= "undotree" 
    	end,
  	},
}

