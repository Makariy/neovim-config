
return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
	"mfussenegger/nvim-dap",
	"nvim-neotest/nvim-nio"
  },
  config = function()
	local dap, dapui = require("dap"), require("dapui")
	dapui.setup({
		layouts = {
			{
			  elements = {
				{ id = "scopes", size = 0.7 },
				{ id = "stacks", size = 0.3 },
			  },
			  size = 40, -- Width of the left panel
			  position = "left",
			},
			{
			  elements = {
				{ id = "repl", size = 1.0 },
			  },
			  size = 15, -- Height of the bottom panel
			  position = "bottom",
			},
		},
	})
	dap.listeners.after.event_initialized["dapui_config"] = function()
	  dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
	  dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
	  dapui.close()
	end
  end
}

