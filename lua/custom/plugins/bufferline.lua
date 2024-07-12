-- require('which-key').register { ['<leader>bd'] = { name = 'Close current' } }
-- require('which-key').register { ['<leader>bl'] = { name = 'Close left' } }
-- require('which-key').register { ['<leader>br'] = { name = 'Close right' } }
-- require('which-key').register { ['<leader>bo'] = { name = 'Close others' } }
return {
  -- personally installed plugins
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'ordinal',
        close_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = 'bdelete! %d', -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        --- count is an integer representing total count of errors
        --- level is a string "error" | "warning"
        --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
        --- this should return a string
        --- Don't get too fancy as this function will be executed a lot
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   return '(' .. count .. ')'
        -- end,
        indicator_icon = '',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>'),
        vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>'),
        vim.keymap.set('n', '<leader>bd', ':bd<CR>'),
        vim.keymap.set('n', '<leader>br', ':bufferLineCloseRight<CR>'),
        vim.keymap.set('n', '<leader>bl', ':bufferLineCloseLeft<CR>'),
        vim.keymap.set('n', '<leader>bo', ':bufferLineCloseOthers<CR>'),
        vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true }),
        require('which-key').register { ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' } },

        always_show_bufferline = true,
      },
    },
  },
}
