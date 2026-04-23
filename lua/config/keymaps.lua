local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Make & Utility
map('n', '<leader>m', ':make<CR>', { desc = 'Run make' })
map('n', '<leader>vc', ':edit ' .. vim.fn.stdpath 'config' .. '/init.lua<CR>', { desc = 'Open [V]im [C]onfig' })
map('n', '<leader>td', ':vsplit ~/todo.md<CR>', { desc = 'Open global [T]o[D]o list' })

-- Split Navigation (Normal & Terminal)
local splits = { h = 'left', j = 'lower', k = 'upper', l = 'right' }
for key, dir in pairs(splits) do
  map('n', '<C-' .. key .. '>', '<C-w>' .. key, { desc = 'Move to ' .. dir .. ' split' })
  map('t', '<C-' .. key .. '>', '<C-\\><C-n><C-w>' .. key, { desc = 'Move to ' .. dir .. ' split from terminal' })
end

-- Terminal Splits
map('n', '<leader>ts', ':split | terminal zsh -l<CR>', { desc = 'Open terminal split below' })
map('n', '<leader>tv', ':vsplit | terminal zsh -l<CR>', { desc = 'Open terminal in vertical split' })

-- Markdown Checkbox Toggle
map('n', '<leader>x', function()
  local line = vim.api.nvim_get_current_line()
  if line:match '%-%s*%[%s*%]' then
    vim.api.nvim_set_current_line((line:gsub('%-%s*%[%s*%]', '- [x]')))
  elseif line:match '%-%s*%[x%]' then
    vim.api.nvim_set_current_line((line:gsub('%-%s*%[x%]', '- [ ]')))
  end
end, { desc = 'Toggle Checkbo[x]' })
