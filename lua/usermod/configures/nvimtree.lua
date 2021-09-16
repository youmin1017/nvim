vim.g['nvim_tree_auto_open'] = 1
vim.g['nvim_tree_auto_close'] = 1
vim.g['nvim_tree_gitignore'] = 1
vim.g['nvim_tree_follow'] = 1
vim.g['nvim_tree_highlight_opened_files'] = 1
vim.g['nvim_tree_tab_open'] = 1
vim.g['nvim_tree_group_empty'] = 1
vim.g['nvim_tree_refresh_wait'] = 500
vim.g['nvim_tree_indent_markers'] = 1
vim.g['nvim_tree_lsp_diagnostics'] = 1
vim.g['nvim_tree_git_hl'] = 1

vim.opt.termguicolors = true

-- Tree Keybinds
vim.g.nvim_tree_disable_default_keybindings = 1
local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_bindings = {
    { key = {'<CR>', '<2-LeftMouse>'}, cb = tree_cb('edit') },
    { key = 'i', cb = tree_cb('split')},
    { key = 's', cb = tree_cb('vsplit')},
    { key = 'r', cb = tree_cb('refresh')},
    { key = 'yy', cb = tree_cb('copy_name')},
    { key = 'gy', cb = tree_cb('copy_absolute_path') },
    { key = '^', cb = tree_cb('dir_up') },
    { key = '?', cb = tree_cb('toggle_help')},
    { key = 't', cb = tree_cb('tabnew') },
    { key = '<F2>', cb = tree_cb('rename') },
    { key = '<C-x>', cb = tree_cb('cut') },
    { key = '<C-c>', cb = tree_cb('copy')},
    { key = '<C-v>', cb = tree_cb('paste') },
    { key = 'C', cb = tree_cb('create') },
    { key = 'D', cb = tree_cb('remove') },
    { key = '<C-d>', cb = tree_cb("cd") },
}

