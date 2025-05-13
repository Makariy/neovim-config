
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
	local harpoon_mark = require("harpoon.mark")

  	local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  	api.config.mappings.default_on_attach(bufnr)

  	vim.keymap.set('n', '<A-m>', function(buf)
		local node = api.tree.get_node_under_cursor()
  		local buf = vim.fn.bufadd(node.absolute_path)
  		vim.fn.bufload(buf)
		harpoon_mark.add_file(node.absolute_path)
  	end, opts("Open tab in background"))
end


return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config
}

