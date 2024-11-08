return {
  'luozhiya/fittencode.nvim',
  config = function()
    require('fittencode').setup({
      use_default_keymaps = true,
      action = {
        keymaps = {
          inline = {
            ['<C-Down>'] = 'accept_all_suggestions',
            ['<C-9>'] = 'accept_line',
            ['<C-0>'] = 'accept_word',
            ['<C-8>'] = 'revoke_line',
            ['<C-7>'] = 'revoke_word',
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
    })
  end,
}
