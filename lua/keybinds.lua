-- leader键设置
vim.g.mapleader = ","
-- 默认的键位函数设置
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true }
}
---------------------------------------------------------------------------
-- 基础键位设置
---------------------------------------------------------------------------
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)
-- 分屏窗口移动
vim.keybinds.gmap("n", "<C-k>", "<c-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-j>", "<c-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-h>", "<c-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", "<c-w>l", vim.keybinds.opts)
-- 用 H 和 L 代替 ^ 与 $
vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)
-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半页
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)
-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<M-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-l>", "<right>", vim.keybinds.opts)
-- 修改分屏大小
vim.keybinds.gmap("n", "<M-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)
-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)
-- 通过 leader cs 切换拼写检查
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)
-- 显示历史弹窗记录
vim.keybinds.gmap("n", "<leader>nh", "<cmd>lua require('telescope').extensions.notify.notify()<CR>", vim.keybinds.opts)
-- 查找 TODO 标签
vim.keybinds.gmap("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- lsp
---------------------------------------------------------------------------
vim.keybinds.gmap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', vim.keybinds.opts)
vim.keybinds.gmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', vim.keybinds.opts)
vim.keybinds.gmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', vim.keybinds.opts)
vim.keybinds.gmap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', vim.keybinds.opts)
vim.keybinds.gmap('n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', vim.keybinds.opts)
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keybinds.bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions theme=dropdown<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>rn', '<cmd>Lspsaga rename<cr>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'v', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<CR>', vim.keybinds.opts)

    vim.keybinds.bmap(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
        vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
        vim.keybinds.opts)

    vim.keybinds.bmap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', vim.keybinds.opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
---------------------------------------------------------------------------
-- buffer
---------------------------------------------------------------------------
-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keybinds.gmap("n", "<M-q>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- 切换上一个缓冲区
vim.keybinds.gmap("n", "<leader>bu", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<leader>bu", "<C-\\><C-n><cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("t", "H", "<C-\\><C-n><cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<leader>bn", "<C-\\><C-n><cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("t", "L", "<C-\\><C-n><cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- 关闭左侧缓冲区
vim.keybinds.gmap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", vim.keybinds.opts)
-- 关闭右侧缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- dap-debug
---------------------------------------------------------------------------
-- 显示或隐藏调试界面
vim.keybinds.gmap("n", "<M-9>", "<cmd>lua require('dapui').toggle()<CR>", vim.keybinds.opts)
-- 打开浮动窗口
vim.keybinds.gmap("v", "<M-k>", "<Cmd>lua require('dapui').eval()<CR>", vim.keybinds.opts)
-- 打断点
vim.keybinds.gmap("n", "<M-4>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", vim.keybinds.opts)
-- 开启调试或到下一个断点处
vim.keybinds.gmap("n", "<M-5>", "<cmd>lua require'dap'.continue()<CR>", vim.keybinds.opts)
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keybinds.gmap("n", "<M-2>", "<cmd>lua require'dap'.step_into()<CR>", vim.keybinds.opts)
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keybinds.gmap("n", "<M-3>", "<cmd>lua require'dap'.step_over()<CR>", vim.keybinds.opts)
-- 步出当前函数
vim.keybinds.gmap("n", "<M-6>", "<cmd>lua require'dap'.step_out()<CR>", vim.keybinds.opts)
-- 重启调试
vim.keybinds.gmap("n", "<M-8>", "<cmd>lua require'dap'.run_last()<CR>", vim.keybinds.opts)
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keybinds.gmap("n", "<M-0>",
    "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>"
    , vim.keybinds.opts)
---------------------------------------------------------------------------
-- search-file or replace-file
---------------------------------------------------------------------------
-- 全项目替换
vim.keybinds.gmap("n", "<M-R>", "<cmd>lua require('spectre').open()<CR>", vim.keybinds.opts)
-- 只替换当前文件
vim.keybinds.gmap("n", "<M-r>", "viw:lua require('spectre').open_file_search()<CR>", vim.keybinds.opts)
-- 全项目中搜索当前单词
vim.keybinds.gmap("n", "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", vim.keybinds.opts)
-- 查找文件
vim.keybinds.gmap("n", "<M-F>", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
-- 查找文字
vim.keybinds.gmap("n", "<M-f>", "<cmd>Telescope live_grep theme=dropdown<CR>", vim.keybinds.opts)
-- 查找特殊符号
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
-- 查找最近打开的文件
vim.keybinds.gmap("n", "<M-o>", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- file-tree
---------------------------------------------------------------------------
-- 打开文件树
vim.keybinds.gmap("n", "<space>e", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
-- 按 leader fc 在文件树中找到当前以打开文件的位置
vim.keybinds.gmap("n", "E", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- terminal
---------------------------------------------------------------------------
-- 退出终端插入模式
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "<M-t>", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
-- 打开浮动终端
vim.keybinds.gmap("n", "<C-t>", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
-- 打开lazy git 终端
vim.keybinds.gmap("n", "<M-G>", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)
-- 要需创建多个终端，可：
-- 1 <键位> leader tt
-- 2 <键位>
-- ... <键位>
-- 另外，上面我们新建了 2 个特殊终端，所以普通终端的顺序应该是从 3 开始



return {
    on_attach = on_attach,
}
