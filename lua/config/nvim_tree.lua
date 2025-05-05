
function config()
	require("nvim-tree").setup({
	  view = {
		side = "left",
		width = 35,
		preserve_window_proportions = true,
		relativenumber = true
	  },
	  renderer = {
		highlight_git = true,
		highlight_opened_files = "all",
	  },
	  actions = {
		open_file = {
		  quit_on_open = true,
		  resize_window = true,
		},
	  },
	  update_focused_file = {
		enable = true,
		update_cwd = true,
	  },
	  git = {
		enable = true,
		ignore = false,
	  },
	  on_attach = on_attach
	})
end

function on_attach(bufnr)
  	local api = require("nvim-tree.api")

  	local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  	api.config.mappings.default_on_attach(bufnr)
  	vim.keymap.set('n', '<C-t>', function()
		api.node.open.tab()
		vim.cmd("tabprev")
		vim.cmd("NvimTreeToggle")
  	end, opts("Open tab in background"))
end


return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config
}

