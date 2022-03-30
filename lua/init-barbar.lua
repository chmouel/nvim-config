local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.bufferline = {
    auto_hide = true,
    icons = false,
    closable = false,
}

-- Move to previous/next
map('n', '<S-TAB>', ':BufferPrevious<CR>', opts)
map('n', '<TAB>', ':BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', ':BufferGoto 1<CR>', opts)
map('n', '<leader>2', ':BufferGoto 2<CR>', opts)
map('n', '<leader>3', ':BufferGoto 3<CR>', opts)
map('n', '<leader>4', ':BufferGoto 4<CR>', opts)
map('n', '<leader>5', ':BufferGoto 5<CR>', opts)
map('n', '<leader>6', ':BufferGoto 6<CR>', opts)
map('n', '<leader>7', ':BufferGoto 7<CR>', opts)
map('n', '<leader>8', ':BufferGoto 8<CR>', opts)
map('n', '<leader>9', ':BufferGoto 9<CR>', opts)
map('n', '<leader>0', ':BufferLast<CR>', opts)
map('n', '<A-c>', ':BufferClose<CR>', opts)
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bd', ':BufferClose<CR>', opts)
map('n', '<Space>bD', ':BufferCloseAllButcurrent<CR>', opts)
