local opt = vim.opt        	-- global/buffer/windows-scoped options
local cmd = vim.cmd    		-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local g = vim.g      		-- global variables

--- mapleader to space
g.mapleader = ","

--- settings
opt.showmatch = true          -- highlight matching parenthesis
opt.incsearch = true
opt.hlsearch = false
opt.swapfile = false          -- don't use swapfile
opt.autochdir = true
opt.smartcase = true
opt.number = false
opt.inccommand = 'split'
opt.termguicolors = true      -- enable 24-bit RGB colors

-- highlight on yank
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smartindent = true    -- autoindent new lines

-- 2 spaces for selected filetypes
cmd[[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]
g.indentLine_char = '|'       -- set indentLine character
cmd[[autocmd FileType markdown let g:indentLine_enabled=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = 'menuone,noselect,noinsert' -- completion options
opt.shortmess = 'c' 	-- don't show completion messages

