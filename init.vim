set nocompatible
set tabstop=2 shiftwidth=2 expandtab
set updatetime=300
set encoding=UTF-8
set shortmess+=c " Avoid showing message extra message when using completion
set cursorline
set relativenumber

lua << EOF
-- LSP
require'lspconfig'.svls.setup{}
require'lspfuzzy'.setup{}
require'lsp_signature'.setup{}

-- lua modules setup
require('usermod.packages')
require('usermod.setting')
require('usermod.configures.lsp_installer')
require('usermod.configures.treesitter')
require('usermod.configures.toggleterm')
EOF

" Colorscheme
highlight NvimTreeFolderIcon guibg=blue
colorscheme onedark

"""""" Map setting 
imap jj <Esc>
imap <M-d> <Del>

lua << EOF
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map('n', '<M-h>', '0', opt)
map('n', '<M-l>', '$', opt)
map('x', '<M-h>', '0', opt)
map('x', '<M-l>', '$', opt)
map('i', '<M-h>', '<Esc>0i', opt)
map('i', '<M-l>', '<Esc>$a', opt)

-- Toggle term
map('n', '<F7>', '<cmd>TermExec cmd="ssh lilina.csie"<CR>', opt)
map('n', '<F8>', '<cmd>TermExec cmd="sftp lilina.csie"<CR>', opt)
map("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opt)

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
xnoremap <expr> P '"_d"'.v:register.'P'
nmap <leader>p "+gp
nmap <leader>y "+y
xmap <leader>d "+d
xmap <leader>y "+y

"""" Toggleterm
nmap <F9>      <cmd>w<CR><cmd>lua RunCode()<CR>
imap <F9> <Esc><cmd>w<CR><cmd>lua RunCode()<CR>

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

