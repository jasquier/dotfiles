return {
  -- Add color schemes.
  { "rose-pine/neovim" },
  { "tanvirtin/monokai.nvim" },

  -- Load desired scheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
