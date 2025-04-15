-- the colorscheme should be available when starting Neovim
return {
    -- "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme carbonfox]])
    end,
    options = {
      -- Compiled file's destination location
      transparent = false,    -- Disable setting background
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,   -- Non focused panes set to alternative background
      module_default = false,  -- Default enable value for modules
      styles = {              -- Style to be applied to different syntax groups
        comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
      inverse = {             -- Inverse highlight for different types
        match_paren = true,
        visual = false,
        search = false,
      },
    },
    palettes = {},
    specs = {},
    groups = {},
}
