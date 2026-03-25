return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED: Initialize harpoon
    harpoon:setup()

    -- 1. Add current file to Harpoon
    vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = '[A]dd file to Harpoon' })

    -- 2. Toggle the Harpoon menu
    vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle Harpoon m[e]nu' })

    -- 3. Teleport to specific files in your list (Leader + Number)
    vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon to file 1' })
    vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon to file 2' })
    vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon to file 3' })
    vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon to file 4' })
  end,
}
