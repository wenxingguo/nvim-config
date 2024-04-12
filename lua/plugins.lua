local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		-- open_fn = function()
		--   return require("packer.util").float { border = "rounded" }
		-- end,
	},
}


--  useage
-- use {
--   "myusername/example",        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports "*" for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }

-- Install your plugins here
local function pconf(plugin)
	return "require(\"pluginconf." .. plugin .. "\")"
end
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	--	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	--	use "williamboman/nvim-lsp-installer"
	--	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	--	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	--	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	--	use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
	--	use 'hrsh7th/cmp-path'     -- { name = 'path' }
	--	use 'hrsh7th/cmp-cmdline'
	--	use 'hrsh7th/cmp-vsnip'
	--	use 'hrsh7th/vim-vsnip'
	--	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	--use 'neoclide/coc.nvim'
	use {"akinsho/toggleterm.nvim", config = function()
		require("toggleterm").setup()
	end}
	use {
		"neoclide/coc.nvim",
        branch = "release",
	}
	use 'sirver/ultisnips'
	use 'honza/vim-snippets'
	--use 'quangnguyen30192/cmp-nvim-ultisnips'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-telescope/telescope.nvim', --tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    --use "folke/tokyonight.nvim"

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
