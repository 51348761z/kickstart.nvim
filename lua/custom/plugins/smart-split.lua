return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {
      -- resizing splits
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left),
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down),
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up),
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right),
      -- moving between splits,
      -- vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left),
      -- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down),
      -- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up),
      -- vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right),
      vim.keymap.set('n', '<C-i>', require('smart-splits').move_cursor_previous),
      -- swapping buffers between windows,
      vim.keymap.set('n', '<leader>bH', require('smart-splits').swap_buf_left, { desc = 'swap_buf_left' }),
      vim.keymap.set('n', '<leader>bJ', require('smart-splits').swap_buf_down, { desc = 'swap_buf_down' }),
      vim.keymap.set('n', '<leader>bK', require('smart-splits').swap_buf_up, { desc = 'swap_buf_up' }),
      vim.keymap.set('n', '<leader>bL', require('smart-splits').swap_buf_right, { desc = 'swap_buf_right' }),
    }
  end,
}
