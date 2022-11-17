-- Install packer if not there
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
    ---------------------
    -- Package Manager --
    ---------------------

    use('wbthomason/packer.nvim')

    ----------------------
    -- Other plugins --
    ----------------------

    -- A better status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-surround'
    use 'vimwiki/vimwiki'
    use 'RRethy/nvim-base16'
    use 'ap/vim-css-color'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
