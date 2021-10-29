local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Telescope
map('n', 'ff', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>')
map('n', 'fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', 'fc', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', 'fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n', 'fb', '<cmd>lua require("telescope.builtin").file_browser()<cr>')
map('n', 'mc', '<cmd>lua require("telescope").extensions.metals.commands()<CR>')

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ws', '<cmd>lua require("metals").worksheet_hover()<CR>')
map('n', '<leader>a', '<cmd>lua require("metals").open_all_diagnostics()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map('n', '[c', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>')
map('n', ']c', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>')

-- nvim-dap
map('n', '<leader>dc', '<cmd>lua require("dap").continue()<CR>')
map('n', '<leader>dr', '<cmd>lua require("dap").repl.toggle()<CR>')
map('n', '<leader>ds', '<cmd>lua require("dap.ui.variables").scopes()<CR>')
map('n', '<leader>dK', '<cmd>lua require("dap.ui.widgets").hover()<CR>')
map('n', '<leader>dt', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>dso', '<cmd>lua require("dap").step_over()<CR>')
map('n', '<leader>dsi', '<cmd>lua require("dap").step_into()<CR>')
map('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>')

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':NvimTreeRefresh<CR>')

-- barbar
map('n', '<C-l>', ':BufferNext<CR>')
map('n', '<C-h>', ':BufferPrevious<CR>')
map('n', '<C-p>', ':BufferPick<CR>', {silent = true})
