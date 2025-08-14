-- Must be placed in .nvim.lua in the root of the project 


function run_debug(filename, args)
  require('dap').run({
    type = "python",
    request = "launch",
    name = "Launch",
    program = "src/" .. filename,
    cwd = vim.loop.cwd(),
    args = args,
    pythonPath = "python" 
  })
end

function debug_test()
  run_debug("main.py", {"test"})
end

function debug_start()
  run_debug("main.py", {"start"})
end

vim.keymap.set('n', '<leader>dt', debug_test, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ds', debug_start, { noremap = true, silent = true })



