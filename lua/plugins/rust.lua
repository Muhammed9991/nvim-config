return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Rust: ' .. desc }) end

          map('<leader>rr', '<cmd>RustLsp runnables<cr>', 'Runnables')
          map('<leader>rt', '<cmd>RustLsp testables<cr>', 'Testables')
          map('<leader>em', '<cmd>RustLsp expandMacro<cr>', 'Expand Macro')
          map('<leader>rd', '<cmd>RustLsp externalDocs<cr>', 'External Docs')
          map('<leader>ca', '<cmd>RustLsp codeAction<cr>', 'Code Action')
          map('K', '<cmd>RustLsp hover actions<cr>', 'Hover Actions')

          if client and client:supports_method 'textDocument/inlayHint' then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
        end,
        default_settings = {
          ['rust-analyzer'] = {
            check = { command = 'clippy' },
            procMacro = { enable = true },
          },
        },
      },
    }
  end,
}
