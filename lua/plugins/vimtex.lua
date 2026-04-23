return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_open_on_warning = 1
    vim.g.vimtex_quickfix_mode = 2

    -- Let VimTeX manage the 'out' directory natively
    vim.g.vimtex_compiler_latexmk = {
      out_dir = 'out',
      continuous = 0,
      options = {
        '-pdf',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        -- Notice there is NO -outdir flag here. 
        -- VimTeX injects it automatically based on build_dir!
      },
    }

    vim.g.vimtex_view_method = 'general'
  end,
  config = function()
    vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompileSS<CR>', { desc = '[L]aTeX [C]ompile (Single Shot)' })
    vim.keymap.set('n', '<leader>lo', '<cmd>VimtexCompileOutput<CR>', { desc = '[L]aTeX [O]utput (Raw Log)' })
    vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>', { desc = '[L]aTeX [E]rrors' })
  end,
}