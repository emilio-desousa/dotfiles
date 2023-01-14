vim.g.loaded_python3_provider = 0
if vim.g.vscode then
    require('core/vscode/options')
    require('plugins/vscode/packer')
else
    require('core/options')
    require('core/keymaps')
    require('plugins/packer')
    require('plugins/mason')
    require('plugins/nvim-treesitter')
	require('plugins/nvim-lsp')
	require('plugins/nvim-cmp')
	require('plugins/cmp-nvim-lsp-config')
	require'lspconfig'.pyright.setup({})
end

