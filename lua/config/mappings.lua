

-- Open help on <Leader>h 
vim.keymap.set({ 'n', 'i' }, '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "cr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { noremap = true, silent = true })

-- binding for file tree view 
vim.keymap.set('n', '<A-e>', ':NvimTreeToggle<CR>', {})

-- bind no highlight 
vim.keymap.set('n', '<leader>n', ':noh<CR>', {})


vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- bind tab switch 
-- vim.keymap.set('n', '<A-Right>', ':tabnext<CR>', { silent = true })
-- vim.keymap.set('n', '<A-Left>', ':tabprevious<CR>', { silent = true })


-- Configuration for commenting lines 
vim.keymap.set('n', '<C-_>', function()
  require('Comment.api').toggle.linewise.current()
  vim.cmd('normal! j')  -- move cursor down
end, { noremap = true, silent = true })

vim.keymap.set('v', '<C-_>', function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)

  local api = require('Comment.api')
  api.toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })



-- maintain cursor on the middle of the screen on <C-d> and <C-u>
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })


-- binding for telescope 
local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fu', telescope.lsp_references, {})     
vim.keymap.set('n', '<leader>fd', telescope.lsp_definitions, {})   



-- Harpoon configuration
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")


vim.keymap.set('n', '<A-m>', harpoon_mark.add_file, { silent = true })
vim.keymap.set('n', '<A-d>', harpoon_mark.rm_file, { silent = true })

vim.keymap.set('n', '<A-u>', harpoon_ui.toggle_quick_menu, { silent = true })

vim.keymap.set('n', '<A-Left>', harpoon_ui.nav_prev, { silent = true })
vim.keymap.set('n', '<A-Right>', harpoon_ui.nav_next, { silent = true })

vim.keymap.set('n', '<A-h>', function() harpoon_ui.nav_file(1) end, { silent = true })
vim.keymap.set('n', '<A-j>', function() harpoon_ui.nav_file(2) end, { silent = true })
vim.keymap.set('n', '<A-k>', function() harpoon_ui.nav_file(3) end, { silent = true })
vim.keymap.set('n', '<A-l>', function() harpoon_ui.nav_file(4) end, { silent = true })


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
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set('n', '<leader>gg', function()
  local fugitive_win = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_is_valid(buf) and
       vim.api.nvim_buf_get_name(buf):match("^fugitive://") and
       vim.api.nvim_win_get_option(win, 'diff') then
      fugitive_win = win
      break
    end
  end

  if fugitive_win then
    vim.api.nvim_win_close(fugitive_win, false)

    vim.cmd('diffoff!')
  else
    vim.cmd('rightbelow Gvdiffsplit')	
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w><left>", true, false, true), 'n', false)
  end
end, { desc = "Toggle Git diff" })


vim.keymap.set("n", "<leader>gp", ":diffget", { desc = "Get from current buffer" })


-- Pyrefac config 
vim.keymap.set("x", "<leader>ms", ":PyrefacMove<CR>", { desc = "Move symbols" })


