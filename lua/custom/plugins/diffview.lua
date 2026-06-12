vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

require('diffview').setup {
  view = {
    merge_tool = {
      layout = 'diff3_mixed',
      disable_diagnostics = true,
    },
  },
}

vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [D]iff view' })
vim.keymap.set('n', '<leader>gm', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [M]erge tool' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = '[G]it file [H]istory' })
vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>', { desc = '[G]it repo [H]istory' })
