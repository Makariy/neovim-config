
return {
  "mfussenegger/nvim-dap",
  config = function()
	local dap = require("dap")
	dap.adapters.python = {
	  type = 'executable',
	  command = 'python',
	  args = { '-m', 'debugpy.adapter' },
	}
	vim.fn.sign_define('DapBreakpoint', {
	  text = '●',         
	  texthl = 'DapBreakpoint',
	  linehl = '',
	  numhl = ''
	})
	vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#FF5555' })
  end
}

