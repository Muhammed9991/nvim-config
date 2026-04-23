return {
  'lervag/vimtex',
  lazy = false, -- VimTeX relies on its own internal lazy-loading
  init = function()
    -- Set latexmk as the default compiler
    vim.g.vimtex_compiler_method = 'latexmk'

    -- Configure latexmk
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'out', -- VimTeX automatically passes -outdir=out under the hood
      continuous = 0, -- 0 disables compile-on-save. It will only compile when you ask.
      options = {
        '-pdf',
        '-shell-escape', -- Required for todonotes, minted, or pythontex
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-outdir=out',
      },
    }

    -- Set the PDF viewer
    vim.g.vimtex_view_method = 'general'
  end,
  config = function()
    -- Set up a custom keybind for a "Single Shot" compile.
    -- When you press <leader>lc, it will compile once and stop.
    vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompileSS<CR>', { desc = '[L]aTeX [C]ompile (Single Shot)' })
  end,
}
