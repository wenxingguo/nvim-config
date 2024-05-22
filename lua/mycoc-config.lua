vim.g.coc_global_extensions = {'coc-json', 'coc-jedi','coc-tsserver', 'coc-clangd', 'coc-pairs', 'coc-snippets', 'coc-cmake'}

vim.g.coc_snippet_next = '<tab>'
vim.g.coc_snippet_prev = '<s-tab>'

local formatdiff = 1
local lines = "all"

vim.cmd "hi CocMenuSel ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey"
--vim.cmd "hi CocMenuSel ctermbg=109 guibg=#13354A"
vim.cmd "hi CocSearch ctermfg=12 guifg=#18A3FF"


vim.cmd [[
function!C_Formatonsave()
  let l:formatdiff=1
  let l:lines="all"
  let g:clang_format_fallback_style="webkit"
  py3file /opt/homebrew/opt/clang-format/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.c,*.h,*.cc,*.cpp call C_Formatonsave()
]]

--py3file $HOME/.config/nvim/clang-tools/clang-format.py

vim.cmd "autocmd CursorHold * silent call CocActionAsync('highlight')"

vim.cmd [[
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]]
