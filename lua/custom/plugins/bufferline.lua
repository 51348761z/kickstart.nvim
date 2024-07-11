vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
vim.keymap.set('n', '<leader>br', ':bufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bl', ':bufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>bo', ':bufferLineCloseOthers<CR>')
require('which-key').register { ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' } }
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
        -- indicator = {
        --   icon = '▎', -- this should be omitted if indicator style is not 'icon'
        --   style = 'icon',
        -- },
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        -- diagnostics = 'nvim_lsp',
        -- diagnostics_update_in_insert = false,
        -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   return '(' .. count .. ')'
        -- end,
      },
    },
  },
}
