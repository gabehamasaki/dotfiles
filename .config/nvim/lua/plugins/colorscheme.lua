return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/vscode.nvim", name = "vscode" },
}
