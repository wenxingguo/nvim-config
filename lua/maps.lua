local map = vim.api.nvim_set_keymap
-- Getting stuck in ~~vim~~ terminal
map("t", "<Esc>", "<C-\\><C-n>", {})
map("n", "fzf", ":FZF<CR>", { silent = true })
-- Quick cursor movement
map("n", "<C-Down>", "5j", { noremap = true })
map("n", "<C-Up>", "5k", { noremap = true })
-- Quick pasting/yoinking to system register
map("n", "+y", "\"+y", { noremap = true })
map("n", "+p", "\"+p", { noremap = true })
map("n", "+d", "\"+d", { noremap = true })
map("n", "*y", "\"*y", { noremap = true })
map("n", "*p", "\"*p", { noremap = true })
map("n", "*d", "\"*d", { noremap = true })
-- symbol renaming
map("n", "-n", "<Plug>(coc-rename)", { silent = true })
-- apply AutoFix to problem on current line
map("n", "-f", "<Plug>(coc-fix-current)", { silent = true })
-- open action dialog
map("n", "-a", ":CocAction<CR>", { silent = true })
-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", { silent = false })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = false })
map("n", "gi", "<Plug>(coc-implementation)", { silent = false })
map("n", "gr", "<Plug>(coc-references)", { silent = false })
-- Use K to show documentation in preview window.
map("n", "K", ":call CocActionAsync(\'doHover\')<CR>", { silent = true })
-- use space o to show symbols
map("n", "<space>o", ":CocList -I symbols<CR>", { silent = true })
-- format code
map("n", "-r", ":call CocActionAsync(\'format\')<CR>", { silent = true })
-- Use <c-space> to trigger completion.
map("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
-- Use -d to jump to next diagnostic
map("n", "-d", "<Plug>(coc-diagnostic-next)", { silent = true })
-- Use -o to show outline
map("n", "-o", ":CocList outline<CR>", { silent = true })

map("n", "<m-t>", "<Cmd>exe v:count1 .\"ToggleTerm direction=float\"<CR>", {silent = false})
map("n", "<m-=>", "<Cmd>exe v:count1 .\"ToggleTerm direction=float\"<CR>", {silent = false})

map("n", "<c-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>" ,{silent = true})
vim.cmd [[
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]
--vim.cmd "nnoremap <silent><m-t> <Cmd>exe v:count1 . \"ToggleTerm\"<CR>"

