

-- Open help on <Leader>h 
vim.keymap.set({ 'n', 'i' }, '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "cr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
vim.keymap.set({"n", "v"}, '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
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
vim.keymap.set("n", "gs", vim.cmd.Git)
vim.keymap.set('n', '<leader>gg', ":Gvdiffsplit!<CR>", { desc = "Open merge" })
vim.keymap.set('n', '<leader>gt', ":Gwrite<CR>", { desc = "Finilize merge" })

vim.keymap.set({"n", "v"}, "<leader>gl", ":diffget //2<CR>", { desc = "Get from left buffer" })
vim.keymap.set({"n", "v"}, "<leader>gr", ":diffget //3<CR>", { desc = "Get from right buffer" })


-- Pyrefac config 
vim.keymap.set("x", "<leader>ms", ":PyrefacMove<CR>", { desc = "Move symbols" })



