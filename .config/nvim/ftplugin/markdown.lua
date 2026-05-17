-- vim.opt_local.concealcursor = "nc"
vim.opt_local.wrap = false
vim.opt_local.expandtab = true
vim.opt_local.linebreak = true
vim.opt_local.showbreak = "|"
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- markview settings
local presets = require("markview.presets");
require("markview").setup(presets.no_nerd_fonts);
