return require('packer').startup(function(use)
    use { 'mg979/vim-visual-multi' , branch='master'}
    use 'easymotion/vim-easymotion'
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'williamboman/mason.nvim' 
	use 'olimorris/onedarkpro.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use "nvim-lua/plenary.nvim"
end)
