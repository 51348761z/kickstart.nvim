return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        -- default
        -- enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        -- max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        -- min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        -- line_numbers = true,
        -- multiline_threshold = 5, -- Maximum number of lines to show for a single context
        -- trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        -- mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- -- Separator between context and content. Should be a single character string, like '-'.
        -- -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        -- separator = nil,
        -- zindex = 5, -- The Z-index of the context window
        -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        -- custom
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
      vim.keymap.set('n', '[t', function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end, { silent = true, desc = 'Goto context' })
    end,
  },
  {
    -- 针对文件类型注释
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    event = { 'User FileOpened' },
    opts = {},
  },
}
