" How to use the plug thing: 
" run ./install.py --clang-completer
" in the .vim/Plug/YouCompleteMe directory
" to comile YCM with support for c-language 
" autocomplete.
"
" To activate plugins initially: 
" :source %
" :PlugInstall

call plug#begin('~/.vim/plugged')

" githubUser/repo
Plug 'junegunn/vim-easy-align'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'

Plug 'altercation/vim-colors-solarized'

Plug 'valloric/youcompleteme'

call plug#end()

autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>

let g:nerdtree_tabs_open_on_console_startup=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:NERDTreeDirArrows=0

set encoding=utf-8
