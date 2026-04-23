return {
  'linux-cultist/venv-selector.nvim',
  ft = 'python',
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
  },
  opts = {
    search = {
      miniforge_envs = {
        command = 'fd /bin/python$ /Users/muhammedmahmood/miniforge3/envs --full-path --color never',
        type = 'anaconda',
      },
    },
  },
}
