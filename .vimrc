" Plugin Manager pathogen
execute pathogen#infect()
syntax on

" Plugin YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_use_ultisnips_completer = 1
" YouCompleteMe YouComplete Goto definition, declaration, include
" <c-o> to outside and <c-i> to inside
nnoremap  <c-]>	 :YcmCompleter GoTo<cr>

" TODO a plugin to manage all vim triggers go really well,
" using states to define as plugin trigger redirect

" Plugin UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
filetype plugin indent on

" Autoconfigure filetypes by extension
augroup filetypedetect
"Octave syntax
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
	au BufRead,BufNewFile *.m,*.oct set smartindent
"C++ syntax
	au BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp set cindent
"Makefile syntax
	au BufRead,BufNewFile makefile set smartindent
" TODO change it by a snippet
"To script files use complete surround
	"au BufRead,BufNewFile *.h,*.cpp,*.hpp,*.m,*.make,*.oct,*.js,*.css,*.*htm*,*.xml call AutoSurround()
augroup end
" TODO change it by a snippet
" 	* type closer mark exactly after the open mark, shouldn't
" 	generate duplicate closer
" just use inoremap to emulates the snippet trigger
" complete when typed " ( [ ' 
" http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
function AutoSurround()
	inoremap ( ()<Esc>:let leavechar=")"<CR>i
	inoremap [ []<Esc>:let leavechar="]"<CR>i
	inoremap ( ()<Esc>:let leavechar=")"<CR>i
	inoremap { {}<Esc>:let leavechar="}"<CR>i
	inoremap " "<Esc>:call SurroundScoped()<cr>a"
	inoremap ' ''<Esc>:let leavechar="'"<CR>i
endfunction

imap jj <esc>


" show line number (insert mode) and relative line numbers (normal mode)
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" save file easy, ever to save just press ctrl + s
" Normal and interactive mode
nmap <c-j> :w<cr>
imap <c-j> <esc>:w<cr>a

" save and exit, ever to save and exit file press ctrl + x
nmap <c-x> :x<cr>
imap <c-x> <esc>:x<cr>

" auto close brackets test
" imap { brackets<c-j>
" imap {<cr> bracketsNewLine<c-j>
" imap " <space>quotationMarks<c-j>

" imap <expr> } (brackets > 0)? "<c-j>" : "}"
