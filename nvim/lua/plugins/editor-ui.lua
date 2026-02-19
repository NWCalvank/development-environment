-- Configure Editor Colours
vim.g.circadian_day_start = 8
vim.g.circadian_night_start = 17
vim.g.circadian_day_theme = os.getenv("NEOVIM_DAY_THEME") or 'dayfox'
vim.g.circadian_night_theme = os.getenv("NEOVIM_NIGHT_THEME") or 'nightfox'

return {
    -- Fancier statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        opts = {
            icons_enabled = true,
            theme = 'nightfox',
            component_separators = '|',
            section_separators = { left = '', right = '' },
        }
    },

    -- Colour & Font Styles
    {   'adamnsch/vim-circadian' },
    {   'projekt0n/github-nvim-theme', name = 'github-theme' },
    {
        "EdenEast/nightfox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- Default options
            require('nightfox').setup({
                options = {
                    -- Compiled file's destination location
                    transparent = false, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = false, -- Default enable value for modules
                    styles = {  -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
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
                    inverse = { -- Inverse highlight for different types
                        match_paren = true,
                        visual = false,
                        search = false,
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })

            -- load the colorscheme here
            vim.cmd([[colorscheme nightfox]])

            -- Custom filetype highlights
            vim.filetype.add({
              extension = {
                handlebars = "html",
              },
            })
        end,

    }
}
