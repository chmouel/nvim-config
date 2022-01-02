require 'format'.setup {
  lua = {
    {
      cmd = {
        function(file)
          return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
        end
      }
    }
  },
  vim = {
    {
      cmd = {"luafmt -w replace"},
      start_pattern = "^lua << EOF$",
      end_pattern = "^EOF$"
    }
  },
  lua = {
    {
      cmd = {"nixpkgs-fmt"},
      tempfile_postfix = ".tmp",
    }
  }
}

vim.fn.execute([[autocmd BufWritePre *.nix FormatWrite]], false)
