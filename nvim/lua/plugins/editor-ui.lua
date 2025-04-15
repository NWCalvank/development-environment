-- Set lualine as statusline
-- See `:help lualine.txt`

return {
    -- Fancier statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = {
            icons_enabled = true,
            theme = 'carbonfox',
            component_separators = '|',
            -- section_separators = '',
            section_separators = { left = '', right = ''},
        }
    },
}
