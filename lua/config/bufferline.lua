

return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		bufferline = require("bufferline")
		bufferline.setup {
  	  	  options = {
    		mode = "tabs", -- or "buffers"
    		separator_style = {" ", " "}, -- "slant", "thick", "thin", "padded_slant", etc.
    		show_close_icon = false,
    		show_buffer_close_icons = false,
    		color_icons = true,
    		style_preset = {
        		bufferline.style_preset.no_italic,
        		bufferline.style_preset.no_bold
    		},
  	  	  }
		}
	end
}

