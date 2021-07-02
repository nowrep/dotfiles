" NeoVim init.vim
"
"
" Map leader to space
let mapleader = ' '

" Load plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'embear/vim-localvimrc'
Plug 'ryanoasis/vim-devicons'
Plug 'benekastah/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-sayonara'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'derekwyatt/vim-fswitch'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'rhysd/clever-f.vim'
Plug 'vim-utils/vim-vertical-move'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/gv.vim'
Plug 'rstacruz/vim-closer'
Plug 'ap/vim-css-color'
Plug 'wellle/visual-split.vim'
Plug 'terryma/vim-expand-region'
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'
Plug 'simnalamburt/vim-mundo'
Plug 'wakatime/vim-wakatime'
Plug 'vimwiki/vimwiki'
Plug 'kopischke/vim-fetch'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'wellle/targets.vim'

" Operators
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Color schemes
Plug 'junegunn/seoul256.vim'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neopairs.vim'

" Games
Plug 'vim-scripts/TeTrIs.vim'
Plug 'mattn/flappyvird-vim'
Plug 'johngrib/vim-game-code-break'

call plug#end()

"------------------------------------------------------------
" Plugin setting

" vim-plug
let g:plug_window = 'split new'

" vim-airline
let g:airline_theme = 'hybridline'
let g:airline_symbols = {}
let g:airline_symbols.branch = '±'
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_inactive_collapse = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#scrollbar#enabled = 0

" vim-polyglot
let g:cpp_class_scope_highlight = 1
let g:cpp_no_function_highlight = 1

" vim-fugitive
set diffopt+=vertical

" vim-gitgutter
let g:gitgutter_map_keys = 0

" clever-f
let g:clever_f_across_no_line = 1

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<Leader><S-e>'
let g:ctrlp_open_new_file = 'r'

" vim-localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2
let g:localvimrc_persistence_file = expand('~') . '/.config/nvim/lvimrc_persistent'

" vim-devicons
let g:webdevicons_enable_nerdtree = 0

" neomake
let g:neomake_open_list = 2
let g:neomake_list_height = 8

let g:neomake_makegcc_maker =
\ {
    \ 'exe': 'make',
    \ 'args': ['-j4'],
    \ 'errorformat': neomake#makers#ft#cpp#gcc().errorformat . ',' .
                \ '%-Gmake%.%#,' .
                \ '%-Gcd %.%#,' .
                \ '%-Gg++ %.%#,'
\ }
let g:neomake_bearmakegcc_maker =
\ {
    \ 'exe': 'bear',
    \ 'args': ['-a', 'make', '-j4'],
    \ 'errorformat': neomake#makers#ft#cpp#gcc().errorformat . ',' .
                \ '%-Gmake%.%#,' .
                \ '%-Gcd %.%#,' .
                \ '%-Gg++ %.%#,'
\ }

" Show build status in airline
augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobStarted let g:neomake_build_running = 1
    autocmd User NeomakeJobFinished let g:neomake_build_running = 0
    autocmd VimEnter * let g:airline_section_error = airline#section#create(['neomake_error_count', 'neomake_build_running'])
augroup END
let g:neomake_build_running = 0
call airline#parts#define_text('neomake_build_running', '  ')
call airline#parts#define_condition('neomake_build_running', 'g:neomake_build_running == 1')

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

" vim-startify
let g:startify_files_number = 6
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_bookmarks =
    \ [
        \ {'z': '~/.zshrc'},
        \ {'v': '~/.config/nvim/init.vim'}
    \ ]

let g:startify_custom_header =
    \ [
        \ '                                                __',
        \ '                   ___      __    ___   __  __ /\_\    ___ ___',
        \ '                 /'' _ `\  /''__`\ / __`\/\ \/\ \\/\ \ /'' __` __`\',
        \ '                 /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \',
        \ '                 \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
        \ '                  \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
        \ '',
        \ '',
    \ ]

let g:startify_custom_footer =
    \ [
        \ '',
        \ '   NeoVim (' . version . ')',
        \ ''
    \ ]

" Language Server Protocol
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"    \ 'c': ['cquery', '--language-server', '--log-file=/tmp/cquery.log'],
"    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cquery.log', '--log-stdin-stdout-to-stderr'],
"\ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.config/nvim/languageclientsettings.json'

" Neosnippet
" let g:neosnippet#disable_runtime_snippets = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1

" Echodoc
let g:echodoc_enable_at_startup = 1

" NERDTree
let g:NERDTreeWinSize = 20

" Maximizer
let g:maximizer_set_default_mapping = 0

" Limelight
let g:limelight_conceal_guifg = '#777777'

" Expand region
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

" Operator flashy
let g:operator#flashy#flash_time = 250

" Vimwiki
let g:vimwiki_list = [
    \ {
    \   'path': '~/.config/nvim/vimwiki'
    \ }
\ ]

"------------------------------------------------------------
" Neovim settings

set termguicolors
set inccommand=nosplit
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>")
            \ | let g:Guifont="<args>"
Guifont Knack:h10

"------------------------------------------------------------
" General settings
"
" Intelligent auto-indenting for each filetype
filetype indent plugin on

" Color scheme
set background=dark
" let g:seoul256_background = 235
colorscheme seoul256

" Transparent background
hi Normal guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi GitGutterAdd guibg=none ctermbg=none
hi GitGutterChange guibg=none ctermbg=none
hi GitGutterDelete guibg=none ctermbg=none
hi GitGutterChangeDelete guibg=none ctermbg=none

" Set zsh as shell
set shell=/bin/zsh

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
set undodir=/tmp//,.

" Allows to switch from an unsaved buffer
" without saving it first.
set hidden

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow vim to set terminal title
set title

" Don't redraw during macros, commands, etc...
set lazyredraw

" Don't use backups
set nobackup

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the
" status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Always keep at least 6 lines visible when scrolling through file
set scrolloff=6
set sidescrolloff=6
set sidescroll=1

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Display line numbers on the left
set number

" Wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Split opening
set splitright

" Show tabline with only one tab
set showtabline=2

" Hide the default mode text
set noshowmode

" Wrap lines at convenient points
set linebreak

" Disable linewrap
" set nowrap

" Highlight current line
" set cursorline

" Automatically reload changed files
set autoread

" Don't use preview window for completions
set completeopt-=preview

set modeline
set modelines=5

""------------------------------------------------------------
" Indentation options
"
" Indentation settings for using 4 spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"
" Visualize whitespace
set list
set listchars=tab:»\ ,nbsp:·,extends:⇢
" precedes:⇠ ↪
"
"------------------------------------------------------------
" Mappings
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Switch opened files with <C-N> and <C-P> in normal mode
nnoremap <C-N> :bnext<Enter>
nnoremap <C-P> :bprev<Enter>

" This is totally awesome - remap jj to escape in insert mode.
" You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Make dot work in visual mode
vnoremap . :norm.<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Move up and down even through wrapped lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Mouse scrolling speed
" nnoremap <ScrollWheelUp> 8<ScrollWheelUp>
" nnoremap <ScrollWheelDown> 8<ScrollWheelDown>

" qq to record, Q to replay
nnoremap Q @q

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
noremap 0 ^
noremap ^ 0

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" EasyMotion
nmap s <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>l <Plug>(easymotion-lineforward)

" Set <F4> for switching between header / source
nnoremap <F4> :FSHere<CR>

" CtrlP
nnoremap <Leader><S-b> :CtrlPBuffer<CR>

" Commentary
nmap <C-_> gcc
vmap <C-_> gc

" Neomake
nnoremap <silent> <Leader><C-b> :wa<CR>:Neomake!<CR>

" Language Server Protocol
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_rename()<CR>

" Neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Deoplete
inoremap <silent><expr> <C-n>
    \ pumvisible() ? "\<C-n>" :
    \ deoplete#mappings#manual_complete()

" Sayonara
nnoremap <Leader><C-w> :Sayonara!<CR>
command BD Sayonara!

" Mundo
nnoremap <silent> <Leader>u :MundoToggle<CR>

" Operator flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Leave terminal mode
tnoremap <C-a> <C-\><C-n>

" Move from terminal window
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

"------------------------------------------------------------
" Autocmd rules
"
augroup vimrc
    autocmd!
    " Folds
    autocmd BufWinEnter * silent! :%foldopen!
    autocmd User Startified setlocal buftype=
    " Comments
    autocmd FileType cpp setlocal commentstring=//%s
    autocmd FileType cmake setlocal commentstring=#%s
    " Quickfix
    autocmd FileType qf wincmd J | setlocal colorcolumn= | setlocal nonumber
    " Syntax from start
    autocmd BufEnter * :syntax sync fromstart
    " CMake
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
    " Tex
    autocmd filetype tex setlocal wrap
    autocmd filetype tex command OpenPdf call system("okular " . expand("build/*.pdf") . "&")
    " Neomake
    autocmd! BufWritePost *.qml Neomake
    " Startify
    autocmd User Startified setlocal buftype=
    " vim-closer
    autocmd FileType rust let b:closer = 1 | let b:closer_flags = '([{'
augroup END

"------------------------------------------------------------
" Misc functions and commands
"

" Czech keymap
function ToggleKeymap()
    if &keymap ==# "czech_utf-8"
        echo "Using English keymap"
        set keymap=
    else
        echo "Using Czech keymap"
        set keymap=czech_utf-8
    endif
endfunction
command ToggleKeymap call ToggleKeymap()

" F8 to edit in hex
let in_hex = 0
function HexMe()
    if in_hex > 0
        :%!xxd -r
        let in_hex=0
    else
        :%!xxd
        let in_hex=1
    endif
endfunction
noremap <F8> :call HexMe()<CR>
