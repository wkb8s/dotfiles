return {
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
    }
}
