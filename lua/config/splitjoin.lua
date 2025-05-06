
return {
	"echasnovski/mini.nvim",
	config = function()
		require('mini.splitjoin').setup({
      		mappings = {
      		  toggle = 'J', -- Change the default toggle key
      		  split = '',     -- Disable split-only mapping
      		  join = '',      -- Disable join-only mapping
      		},
    	})
	end
}

