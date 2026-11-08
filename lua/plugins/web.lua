-- LSPs web que LazyVim no habilita por defecto (no hay extra lang.html/css)
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
      },
    },
  },
}
