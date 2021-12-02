set nocompatible              " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

Plug 'altercation/vim-colors-solarized'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/LeaderF' 

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
" => Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=' '
nnoremap <leader>z 	:NERDTreeToggle<CR>
nnoremap <Leader>x 	:TagbarToggle<CR> 
nnoremap <leader>c 	:LeaderfBufTag<CR>

nnoremap <C-L> 20zl
nnoremap <C-H> 20zh

nnoremap <leader>J J

let g:go_doc_keywordprg_enabled = 0

" Operate tab
nnoremap <leader><C-w> :tabclose<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew 
nnoremap th :tab help 
autocmd FileType help  setlocal number
nnoremap J gT
nnoremap K gt
nnoremap <C-f> <C-w>v <c-]>

" Operate split window
let mapleader=';'
nnoremap Q <C-w>W
nnoremap W <C-w>w
nnoremap <leader>n :vsplit 
nnoremap <leader>c <C-w>c
nnoremap <leader>m <C-w>\|
nnoremap <leader>l <C-w>=
nnoremap <leader><C-f> <C-w><C-]><C-w>T

