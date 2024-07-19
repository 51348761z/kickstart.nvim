return -- lazy.nvim
{
  -- 一个覆写了很多neovim原本UI的插件，很大幅度地提升了美观性。
  -- 将messages重定向到notify
  -- 将搜索、命令显示为独立的命令框，并去除最底部的显示栏，节省空间。
  -- 显示过往Notifications
  -- Telescope整合
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    lsp = {
      -- hover = {
      --   enabled = false,
      -- },
      signature = {
        enabled = false,
      },
    },

    vim.keymap.set('n', '<leader>nl', function()
      require('noice').cmd 'last'
    end, { desc = 'last message' }),
    vim.keymap.set('n', '<leader>nh', function()
      require('noice').cmd 'history'
    end, { desc = 'history' }),
    require('which-key').register { ['<leader>n'] = { name = '[N]oice', _ = 'which_key_ignore' } },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}
