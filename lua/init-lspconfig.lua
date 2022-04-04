-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
--- `init.lua`
local lspconfig = require 'lspconfig'
local utils = require("utils")

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setqflist({open = true})<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

end

-- plugin: nvim-lspconfig
--- For language server setup see: https://github.com/neovim/nvim-lspconfig

-- Bash --> bashls
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
-- set up bash-language-server
if utils.executable('bash-language-server') then
  lspconfig.bashls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
end

-- Python --> pyright
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
if utils.executable('pyright') then
  lspconfig.pyright.setup{
    settings = {
      pyright = {
      }
    }
  }
end

-- GO gopls
if utils.executable('gopls') then
  lspconfig.gopls.setup{on_attach = on_attach}
end

-- JSON
if utils.executable('vscode-language-server') then
lspconfig.jsonls.setup {
    on_attach = on_attach,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
end
