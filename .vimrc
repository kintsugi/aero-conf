set nocompatible    " be iMproved, required
syntax enable

set shell=/bin/bash 
let $BASH_ENV = "~/.bash_aliases"
" Color schemes and GUI settings
colorscheme solarized      " See color schemes in ~/.vim/colors
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termtrans = 1
set background=dark

set guifont=Cousine\ for\ Powerline:h12
set guioptions-=L "Remove toolbar, scroll bar, etc. from mvim
set guioptions-=r
set guioptions-=T

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

vnoremap // y/<C-R>"<CR>
vnoremap /f y/function <C-R>"<CR>

" Mappings

" leader is comma
let mapleader=","

" change working directory to directory containing current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Rolling fingers over jj resets to command mode
imap kj <ESC> 

" Efficiently go into command line mode
nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l   :bnext<CR>

" use ,/ to clear highlighted search
nmap <silent> ,/ :nohlsearch<CR>


" Command to trim whitespace from end of lines
command Trim %s/\s\+$//e

" save session
nnoremap <leader>s :mksession<CR>

" delimitMate auto line split
imap <C-c> <CR><Esc>O

" save folds 
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

" Editor Settings
"
" A tab is 4 space characters with the size of two space characters
set tabstop=4       " Sets the visual appearance of a tab to 2 spaces
set shiftwidth=4    " Sets the # of tabs the << and >> operatorations indent
set noexpandtab
set smarttab        " insert tabs on the start of a line
set autoindent      " Better indenting, used with smart indent
set smartindent     " See :h autoindent and :h smartindent for details
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set nowrap          " don't wrap lines
set hidden          " QoL Buffer. Popular but not 100% sure of the effect. See
" :h hidden
set showmatch       " set show matching parenthesis
set completeopt-=preview
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,
set incsearch       " show search matches as you type
set hlsearch        " highlight search terms
set wildignore=*.swp,*.bak,*.pyc,*.class,*/tmp/*,*.so,*.zip,*/vendor,*/node_modules,*/.DS_Store,*/ios,*/android,*/__tests__,*/flow-typed,*/release,*.o,*/node_modules/*,*/build/*,*/bower_components/*,*/fonts/*
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
set mouse=a
set number          " Show line numbers.
set wildmenu        " visual autocomplete for command menu
set laststatus=2    " vim-airline will not show when there is no split window
set ttimeoutlen=50  " without these two:  https://github.com/vim-airline/vim-airline/issues/130
set lazyredraw
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set regexpengine=1
set rnu

"Place backups in a tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" vim-plug
call plug#begin('~/.vim/plugged')

" vim autocompletion
Plug 'maralla/completor.vim', { 'do': 'make js'}

" tern autocompletion for js
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" js parameter completion
Plug 'othree/jspc.vim'

" snippet engine (related to autocompletion)
Plug 'SirVer/ultisnips'               
" Trigger configuration.

" tmux integration for vim
Plug 'christoomey/vim-tmux-navigator'

Plug 'benmills/vimux' 
" Prompt for a command to run

" colorscheme repo
Plug 'flazz/vim-colorschemes', { 'do': 'mkdir -p ~/.vim/colors && cp colors/* ~/.vim/colors', }         

" directory drawer
Plug 'scrooloose/nerdtree'            

" nerdtree git flags
Plug 'Xuyuanp/nerdtree-git-plugin'

" status bar
Plug 'vim-airline/vim-airline'        

" color themes for status bar
Plug 'vim-airline/vim-airline-themes' 

" git status in gutter
Plug 'airblade/vim-gitgutter'

" File browsing
Plug 'ctrlpvim/ctrlp.vim'             
Plug 'vim-ctrlspace/vim-ctrlspace'
" typing productivity plugins

" Better commenting commands
Plug 'scrooloose/nerdcommenter'       

" Git wrapper
Plug 'tpope/vim-fugitive'             

" surround words with characters
Plug 'tpope/vim-surround'             

" Use . for more than native editor commands
Plug 'tpope/vim-repeat'               

" Cool macros and commands
Plug 'tpope/vim-unimpaired'           

" easily align columns of text
Plug 'junegunn/vim-easy-align'

" Better closing brackets etc.
Plug 'Raimondi/delimitMate'           

" Better direction controls
Plug 'easymotion/vim-easymotion'      

" Syntax Plugins
" async syntax checker
Plug 'w0rp/ale'

" html5 syntax
Plug 'othree/html5.vim'

" javascript syntax 
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" syntax for json
Plug 'elzr/vim-json'

" syntax files for js libraries
Plug 'othree/javascript-libraries-syntax.vim'

" personal wiki
Plug 'vimwiki/vimwiki'

" calendar for vimwiki
Plug 'mattn/calendar-vim'

" relative vimrcs (might not be necessary once I try it editorconfig
Plug 'embear/vim-localvimrc'             

Plug 'sumpygump/php-documentor-vim'
call plug#end()

filetype plugin indent on    " required

" https://github.com/pangloss/vim-javascript/issues/467
let g:javascript_opfirst = 1

" vim-jsx highlighting for .js files
let g:jsx_ext_required = 0

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.wiki setlocal textwidth=80

" move lines up and done
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"Plug 'maralla/completor.vim'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-f>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
let g:completor_completion_delay = 0

"Plug 'ternjs/tern_for_vim'
" enable for react
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"Plug 'SirVer/ultisnips'               
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsJumpForwardTrigger='<leader>r'
let g:UltiSnipsJumpBackwardTrigger='<leader>w'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

"Plug 'benmills/vimux' 
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"Plug 'scrooloose/nerdtree'            
" show line numbers in nerd tree for easier directory nav
let NERDTreeShowLineNumbers=1
" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

"Plug 'vim-airline/vim-airline'        
" vim-airline section settings
let g:airline#extensions#branch#enabled = 1     " enable git branch info
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline_section_x = ''
let g:airline_section_y = ''
set showtabline=0

" color themes for status bar
"Plug 'vim-airline/vim-airline-themes' 
" unicode symbols if not airline symbols
" set powerline font symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"Plug 'ctrlpvim/ctrlp.vim'             
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'

"Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Plug 'easymotion/vim-easymotion'      
" change the default EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget

"Plug 'w0rp/ale'
" ale linting
let g:ale_linters = {
      \   'javascript': ['eslint', 'jslint'],
      \   'jsx': ['eslint', 'jslint'],
      \}
set statusline+=%{ALEGetStatusLine()}
let g:ale_sign_column_always = 1

"Plug 'mxw/vim-jsx'
" vim-jsx highlighting for .js files
let g:jsx_ext_required = 0

"Plug 'vimwiki/vimwiki'
"set vimwiki wiki list
let wiki_knowledge_base = {}
let wiki_knowledge_base.path = '~/vimwiki/knowledge_base'
let wiki_knowledge_base.path_html = ''

let wiki_personal = {}
let wiki_personal.path = '~/vimwiki/personal'
let wiki_personal.path_html = ''

let g:vimwiki_list = [{}, wiki_knowledge_base, wiki_personal]

"Plug 'mattn/calendar-vim'
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()

"Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" ctrlp fuzzy search
nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:CtrlSpaceIgnoredFiles = '\v(node_modules|bower_components|fonts|build)[\/]'
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceMaxHeight = 10

" Don't ask when loading a local vimrc
let g:localvimrc_ask = 0

" end of terminull's vimrc
" ******************************************************************************
" Default vimrc from vimtutor

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set t_Co=256
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
