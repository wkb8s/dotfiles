return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup {
        timeout = 1500,
        max_width = 60,
        stages = "slide"
      }
    end
  }
}
