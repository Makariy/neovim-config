
-- Autosave file when typing 
local timer = vim.loop.new_timer()
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    callback = function()
        timer:stop()
        timer:start(100, 0, vim.schedule_wrap(function()
            if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand('%') ~= "" then
                vim.cmd("silent write")
            end
        end))
    end,
})

