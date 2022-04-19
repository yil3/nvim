-- https://github.com/github/copilot.vim
vim.g.copilot_no_tab_map = true
vim.keybinds.gmap("i", "<C-k>", "copilot#Accept('')", {silent = true, expr = true})
-- 使用 C-k 确认补全
-- 使用 M-[ 查看上一个补全
-- 使用 M-[ 查看下一个补全
-- 使用 C-[ 关闭补全
