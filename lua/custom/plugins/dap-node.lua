local dap = require 'dap'

dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = 18123,
  executable = {
    command = 'node',
    args = {
      vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
      '18123',
    },
  },
}

local base = {
  type = 'pwa-node',
  request = 'launch',
  runtimeExecutable = 'node',
  runtimeArgs = { '-r', 'ts-node/register' },
  args = { '${workspaceFolder}/src/index.ts' },
  env = {
    NODE_PATH = '${workspaceFolder}/src',
    TS_NODE_FILES = 'true',
    TS_NODE_TRANSPILE_ONLY = 'true',
  },
  cwd = '${workspaceFolder}',
  sourceMaps = true,
  resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
  sourceMapPathOverrides = {
    ['./*'] = '${workspaceFolder}/*',
  },
  skipFiles = { '<node_internals>/**', '**/node_modules/**' },
}

local config = {
  vim.tbl_extend('force', base, { name = 'Presto API' }),
  vim.tbl_extend('force', base, {
    name = 'Presto API (prod-copy)',
    envFile = '${workspaceFolder}/.env.prod-copy',
  }),
}

dap.configurations.typescript = config
dap.configurations.javascript = config

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dap-repl',
  callback = function()
    require('dap.ext.autocompl').attach()
  end,
})
