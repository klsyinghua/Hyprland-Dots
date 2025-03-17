return {
  {
    "craftzdog/solarized-osaka.nvim",
    --lazy = true,
    --priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
    config = function()
      -- 设置颜色主题
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
}
