vim.g.nvim_tree_ignore = { '.git', '.bloop' }
vim.g.nvim_tree_group_empty = 1
-- vim.g.nvim_tree_highlight_opened_files = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  auto_close          = true,
  open_on_tab         = true,
  hijack_cursor       = true,
  -- highlight_focused_file = true,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  view = {
    width = 40,
    mappings = {
      custom_only = false,
      list = {
        { key = '<C-h>', cb = tree_cb('vsplit') },
        { key = 'P',     cb = tree_cb('parent_node') },
        { key = '<Tab>', cb = tree_cb('preview') },
        { key = 'K',     cb = tree_cb('first_sibling') },
        { key = 'J',     cb = tree_cb('last_sibling') },
        { key = 'a',     cb = tree_cb('create') },
        { key = 'd',     cb = tree_cb('remove') },
        { key = 'r',     cb = tree_cb('rename') },
        { key = 'x',     cb = tree_cb('cut') },
        { key = 'c',     cb = tree_cb('copy') },
        { key = 'p',     cb = tree_cb('paste') },
        { key = 'y',     cb = tree_cb('copy_name') },
        { key = 'gy',    cb = tree_cb('copy_path') },
        { key = 'Y',     cb = tree_cb('copy_absolute_path') },
      }
    }
  }
}
