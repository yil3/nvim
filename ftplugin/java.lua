vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

local config = require("lsp.jdtls")
require('jdtls').start_or_attach(config)


