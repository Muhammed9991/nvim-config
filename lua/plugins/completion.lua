return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine (Required by nvim-cmp)
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- Your Autocomplete Keymaps
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Next item
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Previous item
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept suggestion
        ['<C-Space>'] = cmp.mapping.complete {}, -- Manually trigger autocomplete
      },

      -- Where the autocomplete data comes from
      sources = {
        { name = 'nvim_lsp' }, -- Your LSPs (Rust, Lua, Python)
        { name = 'luasnip' }, -- Snippets
        { name = 'path' }, -- File paths
        { name = 'buffer' }, -- Words in your current file
      },
    }
  end,
}
