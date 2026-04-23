return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>ca', function() vim.cmd.RustLsp 'codeAction' end, { desc = 'Rust Code Action', buffer = bufnr })

          vim.keymap.set('n', 'K', function() vim.cmd.RustLsp('hover', 'actions') end, { desc = 'Rust Hover Actions', buffer = bufnr })

          if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
        end,
        default_settings = {
          ['rust-analyzer'] = {
            check = {
              command = 'clippy',
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    }
  end,
}
