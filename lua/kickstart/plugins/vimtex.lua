return {
  'lervag/vimtex',
  lazy = false, -- VimTeX relies on its own internal lazy-loading, so we tell Lazy.nvim not to interfere
  init = function()
    -- Set latexmk as the default compiler
    vim.g.vimtex_compiler_method = 'latexmk'
    -- Tell VimTeX to route all compiled files into the 'out/' directory
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-pdf',
        '-interaction=nonstopmode',
        '-synctex=1',
        '-outdir=out',
      },
    }

    -- Set the PDF viewer (you can change this based on your OS)
    -- 'general' usually defaults to your system's default PDF viewer (e.g., Preview on Mac, Evince on Linux)
    vim.g.vimtex_view_method = 'general'
  end,
}
