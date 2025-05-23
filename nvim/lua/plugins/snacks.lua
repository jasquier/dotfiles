return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- for hidden files
        -- ignored = true, -- for .gitignore files
        sources = {
          files = {
            hidden = true,
          },
        },
      },
      terminal = {
        shell = "bash -l",
        win = {
          position = "float",
        },
      },
    },
  },
}
