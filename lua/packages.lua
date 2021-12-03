require 'format'.setup {
    nix = {
        {
            cmd = {"nixpkgs-fmt"},
            tempfile_postfix = ".tmp",
        }
    }
}

vim.fn.execute([[autocmd BufWritePre *.nix FormatWrite]], false)
