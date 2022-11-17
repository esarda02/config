local A = vim.api
-- Highlight the region on yank
local num_au = A.nvim_create_augroup('EEEE', { clear = true })

A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- what is the best place to put this?
local ok, _ = pcall(vim.cmd, 'colorscheme base16-onedark')
