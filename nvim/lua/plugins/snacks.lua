return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -n pikachu -r --no-title; sleep .1",
          random = 10,
          pane = 2,
          indent = 4,
          height = 30,
        },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>k",  function() Snacks.picker.smart() end,                     desc = "Smart Find Files" },
    { "<leader>h",  function() Snacks.picker.buffers() end,                   desc = "Buffers" },
    { "<leader>ps", function() Snacks.picker.grep() end,                      desc = "Grep" },
    { "<leader>:",  function() Snacks.picker.command_history() end,           desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,             desc = "Notification History" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,           desc = "Goto Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,            nowait = true,                desc = "References" },
    -- Other
    { "<leader>d",  function() Snacks.dashboard({ example = "pokemon" }) end, desc = "Show Dashboard" },
    { "<leader>z",  function() Snacks.zen() end,                              desc = "Toggle Zen Mode" },
  },
}
