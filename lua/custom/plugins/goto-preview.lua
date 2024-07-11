local jump_func = function(bufr)
  local function jump()
    require('goto-preview').close_all_win { skip_curr_window = false }
    vim.lsp.buf.definition()
  end

  vim.keymap.set('n', '<CR>', jump, {
    noremap = true,
    silent = true,
    buffer = bufr,
  })
end

return {
  'rmagatti/goto-preview',
  lazy = true,
  keys = { 'gp' },
  require('which-key').register { ['gp'] = { name = '[G]oto [P]review', _ = 'which_key_ignore' } },
  config = function()
    require('goto-preview').setup {
      width = 120,
      height = 25,
      default_mappings = true,
      debug = false,
      opacity = nil,

      -- 不聚焦在预览窗口上时 关闭预览窗
      post_open_hook = function(buf, win)
        local orig_state = vim.api.nvim_buf_get_option(buf, 'modifiable')
        vim.api.nvim_buf_set_option(buf, 'modifiable', false)
        vim.api.nvim_create_autocmd({ 'WinLeave' }, {
          buffer = buf,
          callback = function()
            vim.api.nvim_win_close(win, false)
            vim.api.nvim_buf_set_option(buf, 'modifiable', orig_state)
            return true
          end,
        })
        jump_func(buf)
      end,

      -- post_open_hook = function (bufr)
      --   jump_func(bufr)
      -- end
      -- You can use "default_mappings = true" setup option
      -- Or explicitly set keybindings
      -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
      -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
      -- vim.cmd "nnoremap gpc <cmd>lua require('goto-preview').close_all_win()<CR>",
      vim.keymap.set('n', 'gpc', function()
        require('goto-preview').close_all_win()
      end, { desc = 'close all win' }),
    }
  end,
}
