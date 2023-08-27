require'nvim-treesitter.configs'.setup {
    ensure_installed = { "typescript", "lua", "vim", "vimdoc", "query", "javascript" },
    auto_install = true,
    highlight = {
      enable = true
    }
}
