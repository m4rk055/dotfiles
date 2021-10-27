local cmd = vim.cmd

cmd(
  'autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" } })'
)
cmd('autocmd ColorScheme * highlight link LspCodeLens Conceal')
cmd('augroup END')

vim.g.onedark_termcolors = 256
cmd('set termguicolors')
cmd('set background=dark')
cmd('set encoding=utf-8')
cmd('set mouse=a')
cmd('set tabstop=2')
cmd('set expandtab')
cmd("colorscheme onedark")

vim.g.indentLine_char = '⎸'
-- vim.g.indentLine_leadingSpaceEnabled = 1
-- vim.g.indentLine_leadingSpaceChar = '⋅'

cmd('set number')