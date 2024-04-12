require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	--ignore_buffer_on_setup = false,
    --open_on_setup = true,
	--open_on_setup_file = true,
	git = {
		enable = false,
	},
	actions = {
		change_dir = {
			restrict_above_cwd = true,
		},
	},
    view={
        width=30,
    },
    filters={
        dotfiles=false,
    },
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
} -- END_DEFAULT_OPTS

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
    :hi      NvimTreeBookmarkIcon     guifg=Yellow  gui=italic
]])

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end


vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

