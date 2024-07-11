return {
  -- 搜索并替换项目中所有文件/当前文件/当前选中区域的内容
  -- 在文件窗口中
  -- <leader>osf：在当前文件搜索
  -- <leader>oss：在当前目录（项目）中搜索，包括子文件夹
  -- <leader>osv：在当前选中区域搜索
  -- <leader>osw：在当前选中区域搜索单词
  --
  -- 在Spectre窗口中
  -- <leader>R：替换所有
  -- <leader>rc：替换当前光标所在行的匹配项
  -- <cr>：跳到该匹配项的原文件位置
  -- <leader>q：将所有匹配项发送到quickfix中
  -- ?：查看所有按键
  -- 注：在Spectre窗口中是无法使用<leader>q来退出窗口的，因为有快捷键冲突。需要用<C-w>c来退出。
  'nvim-pack/nvim-spectre',
  -- lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('spectre').setup {
      require('which-key').register { ['<leader>sp'] = { name = '[S]Pectre replace', _ = 'which_key_ignore' } },
      vim.keymap.set('n', '<leader>sP', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Toggle Spectre',
      }),
      vim.keymap.set('n', '<leader>spw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = 'Search current word',
      }),
      vim.keymap.set('v', '<leader>spw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = 'Search current word',
      }),
      vim.keymap.set('n', '<leader>spp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = 'Search on current file',
      }),
    }
  end,
}
