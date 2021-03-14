
scripte utf-8

" ======================== General Settings =============================
" file explorer setting 
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

set clipboard=unnamed
set nocp
set all&
set report=0
set hi=100                 " size of history buffer.
set bs=indent,eol,start    " use backspace
set ru                     " always show cursor position
set sc                     " show current typing word
set nu                     " show line number
set hls                    " highlight searching word
set nows                   " go to the first searching word at the end of searching (disable)
set ic                     " ignore case sensitive
set scs                    " enable smart case sensitive 
set ls=2                   " always show the status line
set background=dark        " set background color dark
set ai                     " auto indentation
set si                     " smart indentation
set wmnu                   " show the list of candidates when using tab autocomplete 
set lz                     " disable to update display while using macro
set lpl                    " load plugins when startup
set showmatch              " highlight matching parenthesis
set wildignorecase         " Ignore the case sensitive when using tab autocompletion"
set autoread               " Automatically update the new change in the buffer.
set cino=N-s               " c++ namespace indentation
set cursorline             " current line highlighting

set t_Co=256

set noswapfile 

set ffs=unix,dos,mac

" tab size
set ts=4
set sw=4

" encoding setting
set enc=utf8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp949,latin1

" font setting
set guifont=MesloLGS_NF\ 11
set guifontwide=MesloLGS_NF\ 11

" hide toolbar, menubar
set guioptions-=T
set guioptions-=m

" tab <==> space change (disabled)
set noet
set sts=0

" disable auto line changing
"set nowrap

" enable auto indentation
set autoindent
set cindent
 
" set the size of gvim
if has("gui_running")
   set lines=50
   set co=125
endif
 
filetype on

" auto recognize the file type
filet plugin indent on

" TBA
filetype plugin on

" Disable automatically insert comment.
au FileType c,cpp setlocal comments-=:// comments+=f://  

"" Read arduino .ino 
au BufRead,BufNewFile *.pde set filetype=pde
au BufRead,BufNewFile *.ino set filetype=arduino

"" Read ROS launch file.
au BufRead,BufNewFile *.launch set filetype=xml

augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
augroup END

" theme 
colorscheme codedark

" ======================== Custom Functions =============================
" Print current working file name.
function! Cwd(...)
	echo expand('%:p')
endfunction
command! -bar Cwd call Cwd()

" Quit all other windows except for the NERD-tree
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()
    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction
command! Only call OnlyAndNerdtree()

" ======================== General Mapping =============================
" tmux-vim ABCD error fix
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" { + Enter to make auto other parenthesis.
inoremap {<CR> {<CR>}<C-o>O
inoremap {<Tab> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap (<Tab> (<CR>)<C-o>O

" Delete key in insert mode.
imap <C-D> <Del>

" Undo in insert mode.
imap <C-Z> <ESC>ua

" Delete the previous word.
imap <C-R> <ESC>ldbi

" Print current file path.
nmap <C-P> :Cwd<CR>

" Quit other windows except for the NERD-tree
nmap <C-Q> :Only<CR>

" Disable highlighted search word.
nmap t :let @/=""<CR>

" \s press \s on the word you want to replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" buffer switching
map <silent> <C-Left> <c-w>h
map <silent> <C-Down> <c-w>j
map <silent> <C-Up> <c-w>k
map <silent> <C-Right> <c-w>l
map <silent> <C-H> <c-w>h
map <silent> <C-J> <c-w>j
map <silent> <C-K> <c-w>k
map <silent> <C-L> <c-w>l

" Moving cursor in insert mode. 
autocmd VimEnter * imap <C-W> <ESC>wa
imap <C-B> <ESC>ba
autocmd VimEnter * imap <C-H> <ESC>ha
imap <C-J> <ESC>ja
imap <C-K> <ESC>ka
imap <C-L> <ESC>la

"" forward, backward paragraph motion
map . {
map , }

" Go to the end of the line.
imap <C-E> <ESC>A
nnoremap <C-E> A<ESC>

" Go to the beginning of the line.
map <ESC>e <A-E>
imap <A-E> <ESC>I
nnoremap <A-E> I<ESC>

" New line
nnoremap <C-F> o<Esc>
imap <C-O> <ESC>O
imap <C-F> <ESC>o

" Hit enter in normal mode.
nnoremap <CR> i<CR><Esc>  

" Resize the window.
nnoremap <silent> <C-C><C-C> :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <C-C><C-V> :exe "resize " . (winheight(0) * 11/10)<CR>

" redo
nmap U :redo<CR>

" Quit without saving.
nnoremap Q ZQ
nnoremap W ZZ

" Automatrically close the quickfix window after done using.
autocmd FileType qf nnoremap <buffer> <Enter> <Enter>:cclose<CR>

" ======================== Plugin Mapping =============================
" mark and unmark
map <F4> <Plug>MarkClear        
map <F5> <Plug>MarkSet         

" Nerdtree 
nmap <C-N> :NERDTreeToggle<CR> 
nnoremap <leader>z :NERDTreeFind<CR>

" Tagbar
nmap <C-T> :Tagbar<CR>            


if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
	  " git gutter for macosx
	  map <leader>gr <Plug>(GitGutterUndoHunk)<CR>
	  map <leader>gn <Plug>(GitGutterNextHunk)<CR>
	  map <leader>gp <Plug>(GitGutterPrevHunk)<CR>
  else
	  " git gutter for linux
	  map <leader>gr <Plug>GitGutterUndoHunk<CR>
	  map <leader>gn <Plug>GitGutterNextHunk<CR>
	  map <leader>gp <Plug>GitGutterPrevHunk<CR>
  endif
endif

" vim-airline buffer control.
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nnoremap <leader>c :bp\|bd #<CR><CR>

" vim-lsp
execute "set <M-.>=\e."
execute "set <M-,>=\e,"
nnoremap <M-.> :LspDefinition<CR>
nnoremap <M-,> <C-o>
nnoremap <leader>f :LspReferences<CR>

" ======================== Plugin Settings =============================
" nerdtree position
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=0

" vim-airline
set laststatus=2 " turn on bottom bar
let g:airline#extensions#tabline#enabled=1       " turn on buffer list
let g:airline#extensions#tabline#fnamemod=':t'   " show only filename
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_powerline_fonts=1

" Indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" vim-diminactive
let g:diminactive_enable_focus = 1

" vim-cpp syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"" vim-go settings
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
map <F2> :GoDef<CR>

" vim-lsp (using clangd)
if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		" macosx for clangd (6.0)
		if executable('clangd')
			augroup lsp_clangd
				autocmd!
				autocmd User lsp_setup call lsp#register_server({
							\ 'name': 'clangd',
							\ 'cmd': {server_info->['clangd']},
							\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
							\ })
			augroup end
		endif
	else
		" linux for clangd-9 
		if executable('clangd-9')
			augroup lsp_clangd
				autocmd!
				autocmd User lsp_setup call lsp#register_server({
							\ 'name': 'clangd',
							\ 'cmd': {server_info->['clangd-9']},
							\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
							\ })
			augroup end
		endif
	endif
endif

" python ($ pip install python-language-server)
if executable('pyls')
	augroup lsp_clangd
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'pyls',
					\ 'cmd': {server_info->['pyls']},
					\ 'whitelist': ['python', 'python3'],
					\ })
	augroup end
endif

	augroup LspGo
		  au!
		    autocmd User lsp_setup call lsp#register_server({
			        \ 'name': 'go-lang',
			        \ 'cmd': {server_info->['gopls']},
			        \ 'whitelist': ['go'],
				    \ })
			autocmd FileType go setlocal omnifunc=lsp#complete
			"autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
			"autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
			"autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
	augroup end

if executable('html-languageserver')
	au User lsp_setup call lsp#register_server({
				    \ 'name': 'html-languageserver',
	                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
	                \ 'whitelist': ['html'],
	                \ })
endif


if executable('css-languageserver')
	au User lsp_setup call lsp#register_server({
	                \ 'name': 'css-languageserver',
	                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
	                \ 'whitelist': ['css', 'less', 'sass'],
	                \ })
endif

if executable('vim-language-server')
	au User lsp_setup call lsp#register_server({
	                \ 'name': 'vim-language-server',
	                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vim-language-server --stdio']},
	                \ 'whitelist': ['vim', 'vimrc'], 
	                \ })
endif


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1

" ======================== Plugins =============================
set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim/
 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'             
Plugin 'The-NERD-tree'                    " File browser
Plugin 'ctags.vim'                        " Function navigaion
Plugin 'snipMate'                         " Snippet
Plugin 'tComment'                         " C+_ C+_ block comment.
Plugin 'EasyMotion'                       " \w, \b to fast navigation.
Plugin 'AutoClose'                        " [] {} Automatric parenthesis. {} ()
Plugin 'Mark'                             " F4, F5 to mark.
Plugin 'majutsushi/tagbar'                " Function navigation.
Plugin 'nathanaelkane/vim-indent-guides'  " Indentation
Plugin 'vim-airline/vim-airline'          " Airline for decoration of vim.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'               " vim with git command(e.g., Gdiff)
Plugin 'blueyed/vim-diminactive'          " Highlight the current working window.
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ code highlighting.
Plugin 'airblade/vim-gitgutter'           " Git changelog tracker.
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'fatih/vim-go'
Plugin 'ryanolsonx/vim-lsp-javascript'
Plugin 'pangloss/vim-javascript'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" Plugin 'gtags.vim'
" Plugin 'minibufexpl.vim'  
" Plugin 'valloric/youcompleteme'           " C++, Python Autocomplete.
call vundle#end()

" ======================== Special Settings =============================
syntax on                   " auto syntax highlight
filetype plugin indent on

set whichwrap+=h,l,<,>   " auto line switching at the end of line
