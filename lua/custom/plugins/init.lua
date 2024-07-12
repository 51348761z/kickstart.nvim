-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- 显示左侧图标指示列
vim.wo.signcolumn = 'yes'
-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = 80
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
-- vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 禁止折行
-- vim.wo.wrap = false
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = 'space:·'
-- 补全增强
-- vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示n行
vim.o.pumheight = 16
-- 永远显示 tabline
-- vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = true
-- vim.o.completeopt = 'menuone,noselect,preview'
-- 状态栏高度
-- vim.o.cmdheight = 0

vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<C-e>', '<ESC>A')
vim.keymap.set('i', '<C-a>', '<ESC>I')
vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
-- vim.opt['tabstop'] = 2
-- vim.opt['shiftwidth'] = 2

-- For neovide
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>')
  vim.keymap.set('v', '<D-c>', '+y') -- copy
  vim.keymap.set('n', '<D-v>', '+P') -- paste normal mode
  vim.keymap.set('v', '<D-v>', '+P')
  vim.keymap.set('c', '<D-v>', '<C-R>+')
  vim.keymap.set('i', '<D-v>', '<C-R>+')
  -- vim.o.guifont = 'ComicMono NF:h20' -- text below applies for vimScript
  vim.o.guifont = 'Agave Nerd Font Mono:h20' -- text below applies for vimScript
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
  vim.g.neovide_window_blurred = true
end
return {
  {
    -- 自动记忆当前文件位置，在下次打开时定位到上次位置。
    'ethanholz/nvim-lastplace',
    opts = {},
  },
  {
    -- 括号高亮
    'hiphish/rainbow-delimiters.nvim',
  },
  {
    -- dimming the highlights of unused functions, variables, parameters, and more
    'zbirenbaum/neodim',
    event = 'LspAttach',
    config = function()
      require('neodim').setup {
        refresh_delay = 75,
        alpha = 0.75,
        blend_color = '#000000',
        hide = {
          underline = true,
          virtual_text = true,
          signs = true,
        },
        regex = {
          '[uU]nused',
          '[nN]ever [rR]ead',
          '[nN]ot [rR]ead',
        },
        priority = 128,
        disable = {},
      }
    end,
  },
  {
    -- Automatically expand width of the current window;
    -- Maximizes and restores the current window.
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup {
        autowidth = {
          enable = false,
        },
      }
    end,
  },
  {
    --  打开多窗口时，在当前焦点窗口周围显示紫色的边框
    'nvim-zh/colorful-winsep.nvim',
    config = true,
    event = { 'WinLeave' },
  },
  {
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle [O]utline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}
