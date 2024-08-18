return {
  {
    "hrsh7th/cmp-path",
    lazy = false,
    config = function()
      require'cmp'.setup {
        sources = {
          { name = 'path' }
        }
      }
    end
  }
}

