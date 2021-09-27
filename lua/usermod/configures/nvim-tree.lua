local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- following options are the default
vim.opt.number = false
vim.opt.wrap = false
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = true,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
  update_cwd          = true,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics     = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = {
        { key = {'<CR>', '<2-LeftMouse>'}, cb = tree_cb('edit') },
        { key = 'i', cb = tree_cb('split')},
        { key = 's', cb = tree_cb('vsplit')},
        { key = 'r', cb = tree_cb('refresh')},
        { key = 'yy', cb = tree_cb('copy_name')},
        { key = 'gy', cb = tree_cb('copy_path') },
        { key = 'gY', cb = tree_cb('copy_absolute_path') },
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
    }
  }
}
