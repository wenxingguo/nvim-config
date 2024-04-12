local options = {
    backup = false,                          -- creates a backup file
    -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- keep status bar position close to bottom
    --completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    --conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "chinese",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = true,                        -- we don't need to see things like -- INSERT -- anymore
    swapfile = false,                        -- creates a swapfile
    termguicolors = false,                    -- set term gui colors (most terminals support this)
    timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = false,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    tabstop = 4,                             -- insert 2 spaces for a tab
    autoindent = true,
    cindent = true,
    smartindent = true,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    --numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "no",                      -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 10,                           -- keep 8 height offset from above and bottom
    sidescrolloff = 10,                       -- keep 8 width offset from left and right
    fillchars = 'eob: ',
    syntax = 'on',
    --foldmethod="expr",
    --foldmethod = "indent",                     -- fold with nvim_treesitter
    --foldexpr = "nvim_treesitter#foldexpr()",
    --foldenable = false,                      -- no fold to be applied when open a file
    --foldlevel = 99,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end


--vim.cmd "set background=dark"
--vim.cmd "colorscheme tokyonight dark"
vim.cmd "set termguicolors"
vim.cmd "hi CursorLine cterm=NONE ctermbg=240 guibg=NONE guifg=NONE gui=NONE"
vim.cmd	"hi CursorLineNr ctermfg=5* ctermbg=3* cterm=bold"
vim.cmd "hi PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey"
vim.cmd "hi VertSplit ctermfg=black ctermbg=darkgrey"
vim.cmd "hi comment ctermfg=2"

vim.g.python3_host_prog = '$NVIM/nvim-python/bin/python3'
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
