return {
  'ray-x/lsp_signature.nvim',
  -- event = 'VeryLazy',
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = 'rounded',
    },
    doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    max_height = 12, -- max height of signature floating_window
    max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    -- the value need >= 40
    wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully tested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap

    floating_window_off_x = 1, -- adjust float windows x position.
    -- can be either a number or function
    floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
    -- can be either number or function, see examples

    close_timeout = 4000, -- close floating window after ms when laster parameter is entered
    -- fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = '🐼 ', -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    -- or, provide a table with 3 icons
    -- hint_prefix = {
    --     above = "↙ ",  -- when the hint is on the line above the current line
    --     current = "← ",  -- when the hint is on the same line
    --     below = "↖ "  -- when the hint is on the line below the current line
    -- },
    hint_scheme = 'String',
    hint_inline = function()
      return false
      -- return true
    end, -- should the hint be inline(nvim 0.10 only)?  default false
    -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
    -- return 'right_align' to display hint right aligned in the current line
    hi_parameter = 'LspSignatureActiveParameter', -- how your parameter will be highlight
    -- hi_parameter = 'InSearch', -- how your parameter will be highlight

    always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

    transparency = nil, -- disabled by default, allow floating win transparent value 1~100
    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency

    -- vim.keymap.set({ 'n' }, '<leader>K', function()
    --   require('lsp_signature').toggle_float_win()
    -- end, { silent = true, noremap = true, desc = 'toggle signature' }),
    vim.keymap.set({ 'n' }, '<Leader>k', function()
      vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' }),
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end,
}
