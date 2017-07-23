"source /apollo/env/envImprovement/var/vimrc

" auto reload vim. tips from http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set number
" enable buffer to be hidden
set hidden
" highlight all matches
set hlsearch
let g:EclimCompletionMethod = 'omnifunc'

" Specify a directory for plugins                                                                                                                         
" - For Neovim: ~/.local/share/nvim/plugged 
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-abolish'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
" Make sure you use single quotes
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" YCM might require your system have newer version of compile tools like                                                                                  
" gcc(or clang), and libraries like glibc. Building from source is a good                                                                                 
" option since yum is not update.                                                                                                                         
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-sensible'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'

" Loaded when clojure file is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Multiple file types
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }

" Code to execute when the plugin is lazily loaded on demand
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }


" Initialize plugin system
call plug#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /home/zhihaow/local/google-java-format/google-java-format-1.3-all-deps.jar --aosp"
