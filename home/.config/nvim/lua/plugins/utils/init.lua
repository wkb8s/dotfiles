return {
  "tpope/vim-commentary",
  "Yggdroot/indentLine",
  'jiangmiao/auto-pairs',
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = function()
      vim.g.undotree_WindowLayout = 2
    end
  },
}
