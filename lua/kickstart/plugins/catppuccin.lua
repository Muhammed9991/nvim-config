return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'frappe', -- latte, frappe, macchiato, mocha
  },
  init = function() vim.cmd.colorscheme 'catppuccin' end,
}
