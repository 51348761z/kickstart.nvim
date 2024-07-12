return {
  -- 在Insert模式下，如果你的光标在括号或引号里面（可配置），按<Tab>键跳出括号 注：实际使用时，因为优先级比nvim-cmp低，所以在弹出补全窗口时，需要按<C-e>关闭补全窗口才能使用，所以体验并不是特别好。
  'abecodes/tabout.nvim',
  lazy = false,
  config = function()
    require('tabout').setup {
      tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = '<C-d>', -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = false, -- if the tabkey is used in a completion pum
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' },
      },
      ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {}, -- tabout will ignore these filetypes
    }
  end,
  dependencies = { -- These are optional
    'nvim-treesitter/nvim-treesitter',
    'L3MON4D3/LuaSnip',
    'hrsh7th/nvim-cmp',
  },
  opt = true, -- Set this to true if the plugin is optional
  event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
  priority = 1000,
}
--   {
--   'L3MON4D3/LuaSnip',
--   keys = function()
--     -- Disable default tab keybinding in LuaSnip
--     return {}
--   end,
-- }
