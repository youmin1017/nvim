require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    'javascript', 'jsdoc', 'typescript', 'tsx', 'json',
    'python', 'lua', 'bash', 'cpp', 'c'
  },
}
