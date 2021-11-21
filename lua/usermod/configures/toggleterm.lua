require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader><space>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double', 
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
-- lazygit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'single'
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Run Code Functions
local nvim_command = vim.api.nvim_command
function RunCode()
  local filetype = vim.bo.filetype

  if filetype == 'cpp' then
    nvim_command('TermExec cmd="g++ -std=c++17 % && ./a.out && rm a.out"')
  elseif filetype == 'c' then
    nvim_command('TermExec cmd="gcc % && ./a.out && rm a.out"')
  elseif filetype == 'python' then
    nvim_command('TermExec cmd="python3 %"')
  else
    error('Unsupported Language')
  end

end


