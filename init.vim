set nocompatible
set tabstop=2 shiftwidth=2 expandtab
set updatetime=300
set encoding=UTF-8
set shortmess+=c " Avoid showing message extra message when using completion
"set clipboard=unnamedplus
set cursorline

lua << EOF
-- LSP
--require'lspconfig'.tsserver.setup{}
--require'lspconfig'.pyright.setup{}
require'lspconfig'.svls.setup{}
require'lspfuzzy'.setup{}
require'lsp_signature'.setup{}

-- lua modules setup
require('usermod.packages')
require('usermod.setting')
require('usermod.configures.lsp_installer')
require('usermod.configures.treesitter')
require('usermod.configures.toggleterm')
-- require('usermod.configures.cmp_tabnine')
EOF

" Colorscheme
highlight NvimTreeFolderIcon guibg=blue
let g:onedark_style = 'warmer'
colorscheme onedark

"""""" Map setting 
imap jj <Esc>
imap <M-d> <Del>

lua << EOF
local map = vim.api.nvim_set_keymap
map('n', '<M-h>', '0', { noremap = true, silent = true })
map('n', '<M-l>', '$', { noremap = true, silent = true })
map('x', '<M-h>', '0', { noremap = true, silent = true })
map('x', '<M-l>', '$', { noremap = true, silent = true })
map('i', '<M-h>', '<Esc>0i', { noremap = true, silent = true })
map('i', '<M-l>', '<Esc>$a', { noremap = true, silent = true })
EOF

nmap <Esc> <cmd>noh <CR>

" Put empty line
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>

" Move buffer easily
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Clipboard map in visual mode
nmap <leader>p "+gp
xmap <leader>d "+d
xmap <leader>y "+y

"""" Toggleterm
lua vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
nmap <F9> <cmd> w <CR>:lua RunCode()<CR>
imap <F9> <cmd> w <CR>:lua RunCode()<CR>

"""" Smoothi
let g:smoothie_no_default_mappings = 1
nmap <silent> <C-d> <cmd>call smoothie#downwards() <CR>
nmap <silent> <C-f> <cmd>call smoothie#upwards()   <CR>

"""" Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""" LSP
nnoremap <silent> <leader>lD <cmd>lua vim.lsp.buf.declaration()                  <CR>
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.document_symbol()              <CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()                   <CR>
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()                   <CR>
nnoremap <silent> <leader>la <cmd>lua vim.lsp.buf.code_action()                  <CR>
nnoremap <silent> <leader>lk <cmd>lua vim.lsp.diagnostic.goto_prev()             <CR>
nnoremap <silent> <leader>lj <cmd>lua vim.lsp.diagnostic.goto_next()             <CR>
nnoremap <silent> <leader>lf <cmd>lua vim.lsp.buf.formatting()                   <CR>
nnoremap <silent> <leader>le <cmd>lua vim.lsp.diagnostic.show_line_diagnostics() <CR>
nnoremap <silent> <leader><F2> <cmd>lua vim.lsp.buf.rename()                     <CR>

"""" Nvim Tree
nnoremap <leader>T :NvimTreeToggle<CR>

"""" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files() <CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()  <CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()    <CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()  <CR>

