set nocompatible              " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Tools
Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdtree'
Plug 'kshenoy/vim-signature'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF' 

" Code Navigation
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags' 

Plug 'voldikss/vim-floaterm'
" Plug 'fatih/vim-go'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
let mapleader=' '
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
unlet mapleader

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自适应不同语言的智能缩进
filetype indent on
" " 将制表符扩展为空格
set expandtab
" " 设置编辑时制表符占用空格数
set tabstop=4
" " 设置格式化时制表符占用空格数
set shiftwidth=4
" " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

set nu
set background=dark
colorscheme gruvbox
set hlsearch
set cursorline
set cursorcolumn
syntax enable
syntax on
set t_Co=256

let g:airline_theme='luna'

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

set foldmethod=syntax
set nofoldenable
set nowrap
set incsearch
set splitright
set tags=./tags;/

" good airline
let g:go_doc_keywordprg_enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" gutentags only work for matched .root_project
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root_project']

" show match count
set shortmess-=S

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=' '
nnoremap <leader><C-f> 		:GoDef<CR>
nnoremap <Leader>tt 	:TagbarToggle<CR> 
nnoremap <leader>c 	:LeaderfBufTag<CR>
" nnoremap <leader>c 	:Leaderf function --nowrap<CR>
" nnoremap <leader>v 	:LeaderfBufTagAll<CR>

nnoremap <C-L> 20zl
nnoremap <C-H> 20zh

nnoremap <leader>J J

inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

unlet mapleader

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
nnoremap Q <C-w>W
nnoremap W <C-w>w
nnoremap <leader>n :vsplit 
nnoremap <leader>c <C-w>c
nnoremap <C-f> <C-w>v<C-]>zz
nnoremap <leader><C-f> <C-w>w<C-w>c<C-w>v<C-]>zz<C-w>W
nnoremap <leader>m <C-w>\|
nnoremap <leader>l <C-w>=
unlet mapleader

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=' '
nnoremap J gT
nnoremap K gt
nnoremap tc :tabclose<CR>
nnoremap <leader><C-w> :tabclose<CR>
nnoremap tn :tabnew 
nnoremap ts :vsplit 
autocmd FileType help  setlocal number
nnoremap th :tab help 
nnoremap <leader><C-f> <C-w>v<C-]><C-w>Tzz
nnoremap <Leader>tn :tnext<CR>
nnoremap <Leader>tp :tprevious<CR>
unlet mapleader

" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized

inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <up>
inoremap <C-j> <down>

inoremap jk <esc>
vnoremap jk <esc>

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END
