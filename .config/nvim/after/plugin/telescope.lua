require('telescope').setup({
  defaults = {
    preview = {
      check_mime_type = true,
      timeout = 100,
      msg_bg_fillchar = ' ',
      hide_on_startup = false
    }
  },

  extensions = {
    file_browser = {
      mappings = {
        ["i"] = {
          ["<C-t>"] = require "telescope.actions".select_tab
        }
      }
    }
  },
})

-- telescope load extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('heading')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
