return {
  'luozhiya/fittencode.nvim',
  config = function()
    require('fittencode').setup()
  end,
  use_default_keymaps = false,
  keymaps = {
    inline = {
      ['<C-Down>'] = 'accept_all_suggestions',
      ['<C-]>'] = 'accept_line',
      ['<C-Right>'] = 'accept_word',
      ['<C-[>'] = 'revoke_line',
      ['<C-Left>'] = 'revoke_word',
      ['<A-\\>'] = 'triggering_completion',
    },
    chat = {
      ['q'] = 'close',
      ['[c'] = 'goto_previous_conversation',
      [']c'] = 'goto_next_conversation',
      ['c'] = 'copy_conversation',
      ['C'] = 'copy_all_conversations',
      ['d'] = 'delete_conversation',
      ['D'] = 'delete_all_conversations',
    },
  },
}
