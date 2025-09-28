
return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.splitjoin").setup({
      		mappings = {
      		  toggle = "<C-j>", -- Change the default toggle key
      		  split = "",     -- Disable split-only mapping
      		  join = "",      -- Disable join-only mapping
      		},
    	})
    	require("mini.pairs").setup({})
    	require("mini.comment").setup({
			mappings = {
				comment_line = "<C-_>",
				comment_visual = "<C-_>"
			},
			hooks = {
				post = function(something) 
					if something.line_end ~= something.line_start then
						return
					end	
  					vim.cmd('normal! j')  -- move cursor down
				end
			}
    	})
	end
}

