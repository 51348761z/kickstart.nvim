return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  cmd = { 'UfoDisable', 'UfoEnable' },

  -- 折叠/展开整个文件的所有内容【zm/zr】，按行实现折叠/展开【zc/zo】
  config = function()
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.cmd [[highlight AdCustomFold guifg=#bf8040]]
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      -- Second line
      local lines = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)
      local secondLine = nil
      if #lines == 1 then
        secondLine = lines[1]
      elseif #lines > 1 then
        secondLine = lines[2]
      end
      if secondLine ~= nil then
        table.insert(newVirtText, { secondLine, 'AdCustomFold' })
      end

      table.insert(newVirtText, { suffix, 'MoreMsg' })

      return newVirtText
    end

    require('ufo').setup {
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
        c = { 'comment', 'region' },
      },
      enable_get_fold_virt_text = false,
      preview = {
        win_config = {
          border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']',
        },
      },
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = handler,
    }
  end,
  vim.keymap.set('n', 'zP', function()
    require('ufo.preview'):peekFoldedLinesUnderCursor()
  end, { desc = 'folding [P]review' }),
  vim.keymap.set('n', 'zE', ':UfoEnable<CR>', { desc = '[E]nable UFO' }),
  vim.keymap.set('n', 'zD', ':UfoDisable<CR>', { desc = '[D]isable UFO' }),
}
