return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  opts = {
    keymap = {
    	preset = 'enter'
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
    	menu = {
			border = "bold"
    	},
    	documentation = {
    		auto_show = true,
    		window = {
				border = "bold"
    		}
    	},
    },
    signature = { enabled = true },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

