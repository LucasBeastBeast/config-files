-- Add Lazy.nvim directory to neovim's runtime path
vim.opt.rtp:prepend('~/.local/share/nvim/lazy/lazy.nvim')


-- Map leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  checker = { enabled = true },
})


-- Setup LSP
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp = require('cmp')
local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'clangd' },
  handlers = {
    default_setup,
  },
})

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Ignore 'vim' as an error in lua
require('lspconfig').lua_ls.setup({
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})

-- Setup required functions
local fn = {}

--Telescope
function fn.telescope(task)
	return require('telescope.builtin')[task]({
		no_ignore = true,
		hidden = true,
	})
end

return fn
