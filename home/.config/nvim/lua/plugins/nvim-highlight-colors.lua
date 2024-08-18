return {
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require("cmp").setup({
                formatting = {
                    format = require("nvim-highlight-colors").format
                }
            })
            require("nvim-highlight-colors").turnOn() -- Is it OK?
        end,
    }
}
