
set nospell
set background=dark
autocmd!

augroup MarkdownFiles
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup end

set backspace=2
set history=999
set number
set scrolloff=10
set encoding=utf-8 nobomb
set hidden
set noswapfile
set nobackup
set nowb
set tabstop=4
set shiftwidth=4
set foldmethod=marker

syntax enable

" Persistent undo
if v:version >= 703
	set undofile
	set undodir=~/.vim/tmp,~/.tmp,~/tmp,/tmp
endif

" Open file and goto previous location.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
	\| exe "normal! g`\""
	\| endif

" Vim session persist
let g:session_autosave = 1
let g:session_autoload = 1

" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Space folds and unfolds.
nnoremap <Space> za
vnoremap <Space> za

"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
