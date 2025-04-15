-- Set lualine as statusline
-- See `:help lualine.txt`
-- require('lualine').setup { options = { icons_enabled = true, theme = 'carbonfox', component_separators = '|', section_separators = '', }, }

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    options = { icons_enabled = true, theme = 'carbonfox', component_separators = '|', section_separators = '', }
}
