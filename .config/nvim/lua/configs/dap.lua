local dap = require 'dap'
local dapGo = require 'dap-go'

dapGo.setup {
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = 'go',
      name = 'Attach remote',
      mode = 'remote',
      request = 'attach',
    },
  },
  -- delve configurations if needed
}
