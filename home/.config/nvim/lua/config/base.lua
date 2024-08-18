vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

-- set line number
vim.wo.number = true
vim.opt.scrolloff = 999

-- display
vim.opt.wrap = false -- テキストの自動折り返しを無効に

-- 空白文字を可視化
vim.opt.list = true

-- 空白文字の表示設定
vim.opt.listchars = {
    tab = "» ",   -- タブ文字の表示 (ここでは「» 」に設定)
    -- eol = "󰌑",   -- 行末の表示
    trail = "·",  -- 行末の空白
    space = "·",  -- スペースの表示
    extends = "→",-- 行末の延長
    precedes = "←" -- 行頭の延長
}

-- indent
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- 保存時に末尾の余計な空白を削除する
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

