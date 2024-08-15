return {
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function()
            require("mason").setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {'neovim/nvim-lspconfig'},
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'clangd'
                }, -- 必要なLSPサーバーを指定
                automatic_installation = true, -- Masonで自動的にLSPサーバーをインストール
            })

            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- 共通の設定を全てのLSPサーバーに適用
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            -- 必要に応じて他の補完ソースを追加
        },
        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- スニペットサポートを追加する場合
                    end,
                },
                mapping = {
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    -- 必要に応じて他のソースを追加
                }
            })
        end,
    },
}