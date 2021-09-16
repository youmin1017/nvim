set tabstop=2 shiftwidth=2 expandtab
set updatetime=300
set encoding=UTF-8
highlight NvimTreeFolderIcon guibg=blue
colorscheme palenightfall


"""" lua modules
lua require('usermod.packages')
lua require('usermod.configures.treesitter')
lua require('usermod.configures.nvimtree')

"""""" Map setting 
imap jj <Esc>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"""" Nvim Tree
nnoremap <leader>T :NvimTreeToggle<CR>

"""" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
