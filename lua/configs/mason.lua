require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'volar'},
    handlers = {
        function(server_name) require('lspconfig')[server_name].setup({}) end,
        volar = function() require('lspconfig').volar.setup({}) end,
        tsserver = function()
            local vue_typescript_plugin =
                require('mason-registry').get_package('vue-language-server'):get_install_path() ..
                    '/node_modules/@vue/language-server' ..
                    '/node_modules/@vue/typescript-plugin'

            require('lspconfig').tsserver.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_typescript_plugin,
                            languages = {'javascript', 'typescript', 'vue'}
                        }
                    }
                },
                filetypes = {
                    'javascript', 'javascriptreact', 'javascript.jsx',
                    'typescript', 'typescriptreact', 'typescript.tsx', 'vue'
                }
            })
        end
    }
})
