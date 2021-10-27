-------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built-in
-- LSP. Be sure to thoroughly read the the `:help nvim-metals` docs to get an
-- idea of what everything does. Again, these are meant to serve as an example,
-- if you just copy pasta them, then they'll work,  but hopefully after time
-- goes on you'll cater them to your own liking.
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore is a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmpe
--   - hrsh7th/cmp-nvim-lsp for lsp completion sources
--   - hrsh7th/cmp-vsnip for snippet sources
--   - hrsh7th/vim-vsnip for snippet support
--
-- - https://github.com/wbthomason/packer.nvim for package management
-- - https://github.com/mfussenegger/nvim-dap (for debugging)
-------------------------------------------------------------------------------
local cmd = vim.cmd
local g = vim.g

----------------------------------
-- VARIABLES ---------------------
----------------------------------
-- g['metals_server_version'] = '0.10.7+119-90f26c65-SNAPSHOT'
-- :MetalsUpdate

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.shortmess:remove('F'):append('c')

----------------------------------
-- COMMANDS ----------------------
----------------------------------
-- LSP
cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])

-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])
----------------------------------
-- LSP Setup ---------------------
----------------------------------
metals_config = require('metals').bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
}

-- Example of how to ovewrite a handler
metals_config.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = '' },
})

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
metals_config.init_options.statusBarProvider = 'on'

-- Example if you are including snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
metals_config.capabilities = capabilities

-- Debug settings if you're using nvim-dap
local dap = require('dap')

dap.configurations.scala = {
  {
    type = 'scala',
    request = 'launch',
    name = 'Run',
    metals = {
      runType = 'run'
    },
  },
  {
    type = 'scala',
    request = 'launch',
    name = 'Test File',
    metals = {
      runType = 'testFile',
    },
  },
  {
    type = 'scala',
    request = 'launch',
    name = 'Test Target',
    metals = {
      runType = 'testTarget',
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require('metals').setup_dap()
end

-- Should link to something to see your code lenses
cmd([[hi! link LspCodeLens CursorColumn]])
-- Should link to something so workspace/symbols are highlighted
cmd([[hi! link LspReferenceText CursorColumn]])
cmd([[hi! link LspReferenceRead CursorColumn]])
cmd([[hi! link LspReferenceWrite CursorColumn]])

-- If you want a :Format command this is useful
cmd([[command! Format lua vim.lsp.buf.formatting()]])