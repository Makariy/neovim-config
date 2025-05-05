
-- Open help on <Leader>h 
vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })


-- binding for file tree view 
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})

-- bind no highlight 
vim.keymap.set('n', '<leader>n', ':noh<CR>', {})

-- bind tab switch 
vim.keymap.set('n', '<A-Right>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<A-Left>', ':tabprevious<CR>', { silent = true })

-- maintain cursor on the middle of the screen on <C-d> and <C-u>
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })



-- binding for telescope 
local telescope = require("telescope.builtin")
function telescope_resume_search_if_available()
  	local state = require('telescope.state')
  	local cached_pickers = state.get_global_key "cached_pickers"
  	if cached_pickers == nil or vim.tbl_isempty(cached_pickers) then
    	require('telescope.builtin').find_files()
	else
    	require('telescope.builtin').resume()
  	end
end 

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_resume_search_if_available, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fu', telescope.lsp_references, {})     
vim.keymap.set('n', '<leader>fd', telescope.lsp_definitions, {})   


-- setup key bindings 
local dap = require("dap")
local dapui = require("dapui")

-- binding for debug 
vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<Leader>do', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>dO', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)
vim.keymap.set('n', '<Leader>dt', function() dap.terminate() end)



-- git mappings 
vim.keymap.set('n', '<leader>gg', function()
  -- Check if Gdiffsplit is already open by looking for fugitive buffers
  local found = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("fugitive://") then
      found = true
      break
    end
  end

  if found then
    vim.cmd("wincmd o")  -- Close other windows (including Gdiff)
  else
    vim.cmd("Gvdiffsplit!")
  end
end, { desc = "Toggle Gvdiffsplit" })


vim.keymap.set("n", "<leader>gl", ":diffget //2<CR>", { desc = "Get from LOCAL" })
vim.keymap.set("n", "<leader>gr", ":diffget //3<CR>", { desc = "Get from REMOTE" })


-- binding to start debug 
function debug_custom_file()
  local args = vim.fn.input("Enter arguments: ")
  args = vim.split(args, ",")
  require('dap').run({
    type = "python",
    request = "launch",
    program = vim.fn.expand('%'),
    args = args
  })
end

vim.keymap.set('n', '<leader>ds', debug_custom_file, { noremap = true, silent = true })


