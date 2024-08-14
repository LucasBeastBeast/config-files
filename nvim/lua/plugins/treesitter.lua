return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',

	config = function () 
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = { 'c', 'lua', 'query', 'bash', 'diff', 'c_sharp', 'cpp', 'java' },
			sync_install = false,
			auto_install = true,  
			highlight = { enable = true },
		})
	end
}
