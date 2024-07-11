return {
  { 'hrsh7th/cmp-cmdline' },
  { -- `/` cmdline setup.
    require('cmp').setup.cmdline('/', {
      mapping = require('cmp').mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    }),
  },
  { -- `:` cmdline setup.
    require('cmp').setup.cmdline(':', {
      mapping = require('cmp').mapping.preset.cmdline(),
      sources = require('cmp').config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    }),
  },
}
