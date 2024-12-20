" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|


" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath





" ===
" === Auto load for first time uses
" ===
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('$HOME/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp $HOME/.config/nvim/default_configs/_machine_specific_default.vim $HOME/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e $HOME/.config/nvim/_machine_specific.vim"
endif


" colorscheme default
colorscheme darkblue

"basic set
syntax on               "开启
" syntax enable
if &t_Co > 1
   syntax enable
endif
set nocompatible
set showmode            "显示模式
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256

"indent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround  "round indent to multiple of 'shiftwidth'

"apearence
set number
set relativenumber
set cursorline
set textwidth=79
" set wrap
set linebreak
"set sidescrolloff=15
set wrapmargin=2
set scrolloff=5
set ruler
set laststatus=2      "总是显示状态栏

"" 状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]    "状态栏绝对路径



"search
set showmatch
set hlsearch
set incsearch
set ignorecase
set infercase   "use with ignorecase for completion
set smartcase
set nowrapscan    "This stops the search at the end of the file.

"edit
"set spell spelllang=en_us
set nospell

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" set shada='1000,f1,<500

" set colorcolumn=100
set updatetime=100
set virtualedit=block
set autochdir
set errorbells
set novisualbell
set history=1000
set autoread
set listchars=tab:\|\ ,trail:▫
set list
set wildmenu
set wildmode=longest:list,full
set clipboard=unnamed

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

if has("autocmd")
  filetype plugin indent on
endif

"if has("vms")
"  set nobackup
"else
"  set backup
"  if has('persistent_undo')
"    set undofile
"  endif
"endif

"if &t_Co > 2 || has ("gui_running")
"  set hlsearch
"endif

set ttimeout
set ttimeoutlen=100


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" noremap ; :

" Save & quit
noremap S :w<CR>
noremap R :source $HOME/.config/nvim/init.vim<CR>
noremap Q :q<CR>
" noremap <LEADER>sa :w<CR>
" noremap <LEADER>qu :q<CR>
noremap <C-q> :qa<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :vsp $HOME/.config/nvim/init.vim<CR>
"noremap <LEADER>rc :vsp $MYVIMRC<CR>

" Open the .zshrc file anytime
noremap <LEADER>sh :vsp ~/.zshrc<CR>

" Open the env.zsh aliases.zsh file anytime
noremap <LEADER>env :vsp $HOME/.config/zsh/env.zsh<CR>
noremap <LEADER>ali :vsp $HOME/.config/zsh/aliases.zsh<CR>

" Open myfilelist anytime
noremap <LEADER>fl :tabedit $HOME/.config/nvim/myfilelist.md<CR>
" Inline open (goto) file
"noremap <LEADER>op 0f/gf

" Open md-snippets anytime
noremap <LEADER>md :vsp $HOME/.config/nvim/md-snippets.vim<CR>


" (){}
map \p i(<Esc>ea)<Esc>
map \c i{<Esc>ea}<Esc>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Open up lazygit
noremap \g :Git 
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
"noremap - Nzz
"noremap = nzz

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>K <C-w>K
noremap <LEADER>J <C-w>J
noremap <LEADER>H <C-w>H
noremap <LEADER>L <C-w>L

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
"noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
"noremap sh <C-w>t<C-w>K
" Place the two screens side by side
"noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" Create a new tab with tn after the current one
noremap tt :tabnew<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
" source $HOME/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
" inoremap <C-> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

inoremap <LEADER>, <++>
inoremap <LEADER>e <Esc>
vnoremap <LEADER>e <Esc>
cnoremap <LEADER>e <Esc>

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" comment one line with # 
noremap <LEADER>m I#<SPACE><ESC>0j
noremap <LEADER>n 0xxj
" comment one line with 
noremap <LEADER>v I"<SPACE><ESC>0j


 " Compile function
noremap t :call CompileRunGcc()<CR>
 func! CompileRunGcc()
 	exec "w"
 	if &filetype == 'c'
 		exec "!g++ % -o %<"
 		exec "!time ./%<"
 	elseif &filetype == 'cpp'
 		set splitbelow
 		exec "!g++ -std=c++11 % -Wall -o %<"
 		:sp
 		:res -15
 		:term ./%<
 	elseif &filetype == 'java'
 		exec "!javac %"
 		exec "!time java %<"
 	elseif &filetype == 'sh'
 		:!time bash %
 	elseif &filetype == 'python'
 		set splitbelow
 		:sp
 		:term python3 %
 	elseif &filetype == 'html'
 		silent! exec "!".g:mkdp_browser." % &"
 	elseif &filetype == 'markdown'
 		exec "InstantMarkdownPreview"
 	elseif &filetype == 'tex'
 		silent! exec "VimtexStop"
 		silent! exec "VimtexCompile"
 	elseif &filetype == 'dart'
 		exec "CocCommand flutter.run -d ".g:flutter_default_device
 		silent! exec "CocCommand flutter.dev.openDevLog"
 	elseif &filetype == 'javascript'
 		set splitbelow
 		:sp
 		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
 	elseif &filetype == 'go'
 		set splitbelow
 		:sp
 		:term go run .
 	endif
 endfunc

" ===
" === Necessary Commands to Execute
" ===
"exec "nohlsearch"
" let g:netrw_browsex_viewer= "chromium"


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('$HOME/.config/nvim/plugged')


" Translation
Plug 'voldikss/vim-translator'

" Testing my own plugin
" Plug 'theniceboy/vim-calc'

" Pretty Dress
" myselfmark Plug 'bling/vim-bufferline'
" myselfmark Plug 'bpietravalle/vim-bolt'
" myselfmark Plug 'theniceboy/vim-deus'

"Plug 'arzg/vim-colors-xcode'

" Status line
" myselfmark Plug 'theniceboy/eleline.vim'

" General Highlighter
" myselfmark Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" myselfmark Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
" myselfmark Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" myselfmark Plug 'kevinhwang91/rnvimr'
" myselfmark Plug 'airblade/vim-rooter'
" myselfmark Plug 'pechorin/any-jump.vim'

" Taglist
" myselfmark Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" myselfmark Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
" myselfmark Plug 'theniceboy/vim-snippets'

" Undo Tree
" myselfmark Plug 'mbbill/undotree'

" Git
" myselfmark Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" myselfmark Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
" myselfmark Plug 'airblade/vim-gitgutter'
" myselfmark Plug 'cohama/agit.vim'

" Autoformat
" myselfmark Plug 'Chiel92/vim-autoformat'

" Tex
" Plug 'lervag/vimtex'

" CSharp
" myselfmark Plug 'OmniSharp/omnisharp-vim'
" myselfmark Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
" myselfmark Plug 'elzr/vim-json'
" myselfmark Plug 'othree/html5.vim'
" myselfmark Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" myselfmark Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
" myselfmark Plug 'HerringtonDarkholme/yats.vim'

" Go
" myselfmark Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" myselfmark Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
" myselfmark Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter
" myselfmark Plug 'dart-lang/dart-vim-plugin'

" Swift
" myselfmark Plug 'keith/swift.vim'
" myselfmark Plug 'arzg/vim-swift'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" myselfmark Plug 'mg979/vim-visual-multi'
" myselfmark Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
" myselfmark Plug 'theniceboy/antovim' " gs to switch
" myselfmark Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
" myselfmark Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
" myselfmark Plug 'junegunn/vim-after-object' " da= to delete what's after =
" myselfmark Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
" myselfmark Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" myselfmark Plug 'easymotion/vim-easymotion'
" Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
" myselfmark Plug 'svermeulen/vim-subversive'
" myselfmark Plug 'theniceboy/argtextobj.vim'
" myselfmark Plug 'rhysd/clever-f.vim'
" myselfmark Plug 'chrisbra/NrrwRgn'
" myselfmark Plug 'AndrewRadev/splitjoin.vim'

" For general writing
" Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
" myselfmark Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
" myselfmark Plug 'skywind3000/asynctasks.vim'
" myselfmark Plug 'skywind3000/asyncrun.vim'

" Vim Applications
" myselfmark Plug 'itchyny/calendar.vim'

" Other visual enhancement
" myselfmark Plug 'ryanoasis/vim-devicons'
" myselfmark Plug 'luochen1990/rainbow'
" myselfmark Plug 'mg979/vim-xtabline'
" myselfmark Plug 'wincent/terminus'

" Other useful utilities
" myselfmark Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'


call plug#end()

" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
" color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

" hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


" ===================== Start of Plugin Settings =====================


" " ===
" " === eleline.vim
" " ===
" let g:airline_powerline_fonts = 0
" 
" 
" " ==
" " == GitGutter
" " ==
" " let g:gitgutter_signs = 0
" let g:gitgutter_sign_allow_clobber = 0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
" " autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>
" 
" 
" " ===
" " === coc.nvim
" " ===
" let g:coc_global_extensions = [
" 	\ 'coc-actions',
" 	\ 'coc-css',
" 	\ 'coc-diagnostic',
" 	\ 'coc-explorer',
" 	\ 'coc-flutter-tools',
" 	\ 'coc-gitignore',
" 	\ 'coc-html',
" 	\ 'coc-json',
" 	\ 'coc-lists',
" 	\ 'coc-prettier',
" 	\ 'coc-pyright',
" 	\ 'coc-python',
" 	\ 'coc-snippets',
" 	\ 'coc-sourcekit',
" 	\ 'coc-stylelint',
" 	\ 'coc-syntax',
" 	\ 'coc-tasks',
" 	\ 'coc-todolist',
" 	\ 'coc-translator',
" 	\ 'coc-tslint-plugin',
" 	\ 'coc-tsserver',
" 	\ 'coc-vimlsp',
" 	\ 'coc-vetur',
" 	\ 'coc-yaml',
" 	\ 'coc-yank']
" inoremap <silent><expr> <TAB>
" 	\ pumvisible() ? "\<C-n>" :
" 	\ <SID>check_back_space() ? "\<TAB>" :
" 	\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()
" function! Show_documentation()
" 	call CocActionAsync('highlight')
" 	if (index(['vim','help'], &filetype) >= 0)
" 		execute 'h '.expand('<cword>')
" 	else
" 		call CocAction('doHover')
" 	endif
" endfunction
" nnoremap <LEADER>h :call Show_documentation()<CR>
" 
" nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
" nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
" nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" nnoremap <c-c> :CocCommand<CR>
" " Text Objects
" xmap kf <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap kf <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" xmap kc <Plug>(coc-classobj-i)
" omap kc <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" " Useful commands
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" " nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" nmap tt :CocCommand explorer<CR>
" " coc-translator
" nmap ts <Plug>(coc-translator-p)
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" " coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" " coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" " coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-e> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-n>'
" imap <C-e> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'David Chen'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
" let g:instant_markdown_port = 8888
" let g:instant_markdown_python = 1


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === FZF
" ===
" set rtp+=/usr/local/opt/fzf
" An action can be a reference to a function that processes selected lines
" noremap <silent> <C-p> :Leaderf file<CR>
" lines of all files in current dir
noremap <silent> <C-k> :Rg<CR>
" lines in all buffer or hisroty?
noremap <silent> <C-l> :Lines<CR>
" file name in current dir
noremap <silent> <C-p> :Files<CR>
noremap <leader>; :History:<CR>
"noremap <C-t> :BTags<CR>
" noremap <silent> <C-w> :Buffers<CR>
noremap <c-e> :BD<CR>
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

let g:fzf_preview_window = 'right:60%'
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction



let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_history_dir = '~/.local/share/fzf-history'


" " ===
" " === Leaderf
" " ===
" " let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_PreviewCode = 1
" let g:Lf_ShowHidden = 1
" let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
" \   '<C-k>': ['<C-u>'],
" \   '<C-j>': ['<C-e>'],
" \   '<C-]>': ['<C-v>'],
" \   '<C-p>': ['<C-n>'],
" \}
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WildIgnore = {
"         \ 'dir': ['.git'],
"         \ 'file': ['__vim_project_root']
"         \}
" let g:Lf_UseMemoryCache = 0
" let g:Lf_UseCache = 0
" 
" 
" " ===
" " === CTRLP (Dependency for omnisharp)
" " ===
" let g:ctrlp_map = ''
" let g:ctrlp_cmd = 'CtrlP'
" 
" 
" " ===
" " === vim-bookmarks
" " ===
" " let g:bookmark_no_default_key_mappings = 1
" " nmap mt <Plug>BookmarkToggle
" " nmap ma <Plug>BookmarkAnnotate
" " nmap ml <Plug>BookmarkShowAll
" " nmap mi <Plug>BookmarkNext
" " nmap mn <Plug>BookmarkPrev
" " nmap mC <Plug>BookmarkClear
" " nmap mX <Plug>BookmarkClearAll
" " nmap mu <Plug>BookmarkMoveUp
" " nmap me <Plug>BookmarkMoveDown
" " nmap <Leader>g <Plug>BookmarkMoveToLine
" " let g:bookmark_save_per_working_dir = 1
" " let g:bookmark_auto_save = 1
" " let g:bookmark_highlight_lines = 1
" " let g:bookmark_manage_per_buffer = 1
" " let g:bookmark_save_per_working_dir = 1
" " let g:bookmark_center = 1
" " let g:bookmark_auto_close = 1
" " let g:bookmark_location_list = 1
" 
" 
" " ===
" " === Undotree
" " ===
" noremap L :UndotreeToggle<CR>
" let g:undotree_DiffAutoOpen = 1
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_ShortIndicators = 1
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 8
" let g:undotree_SplitWidth = 24
" function g:Undotree_CustomMap()
" 	nmap <buffer> u <plug>UndotreeNextState
" 	nmap <buffer> e <plug>UndotreePreviousState
" 	nmap <buffer> U 5<plug>UndotreeNextState
" 	nmap <buffer> E 5<plug>UndotreePreviousState
" endfunc
" 
" 
" " ==
" " == vim-multiple-cursor
" " ==
" "let g:multi_cursor_use_default_mapping = 0
" "let g:multi_cursor_start_word_key = '<c-k>'
" "let g:multi_cursor_select_all_word_key = '<a-k>'
" "let g:multi_cursor_start_key = 'g<c-k>'
" "let g:multi_cursor_select_all_key = 'g<a-k>'
" "let g:multi_cursor_next_key = '<c-k>'
" "let g:multi_cursor_prev_key = '<c-p>'
" "let g:multi_cursor_skip_key = '<C-s>'
" "let g:multi_cursor_quit_key = '<Esc>'
" 
" 
" " ===
" " === vim-visual-multi
" " ===
" "let g:VM_theme             = 'iceblue'
" "let g:VM_default_mappings = 0
" let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
" let g:VM_maps                       = {}
" let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
" let g:VM_maps['i']                  = 'k'
" let g:VM_maps['I']                  = 'K'
" let g:VM_maps['Find Under']         = '<C-k>'
" let g:VM_maps['Find Subword Under'] = '<C-k>'
" let g:VM_maps['Find Next']          = ''
" let g:VM_maps['Find Prev']          = ''
" let g:VM_maps['Remove Region']      = 'q'
" let g:VM_maps['Skip Region']        = '<c-n>'
" let g:VM_maps["Undo"]               = 'l'
" let g:VM_maps["Redo"]               = '<C-r>'
" 
" 
" " ===
" " === Far.vim
" " ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
" 		\ "replace_undo" : ["l"],
" 		\ }
" 
" 
" " ===
" " === vim-calc
" " ===
" "noremap <LEADER>a :call Calc()<CR>
" " Testing
" "if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
" "source ~/Github/vim-calc/vim-calc.vim
" "endif


" " ===
" " === Vista.vim
" " ===
" noremap <LEADER>v :Vista coc<CR>
" noremap <c-t> :silent! Vista finder coc<CR>
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_default_executive = 'ctags'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
" " function! NearestMethodOrFunction() abort
" " 	return get(b:, 'vista_nearest_method_or_function', '')
" " endfunction
" " set statusline+=%{NearestMethodOrFunction()}
" " autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" 
" let g:scrollstatus_size = 15
" 
" " ===
" " === fzf-gitignore
" " ===
" noremap <LEADER>gi :FzfGitignore<CR>
" 
" 
" " ===
" " === Ultisnips
" " ===
" " let g:tex_flavor = "latex"
" " inoremap <c-n> <nop>
" " let g:UltiSnipsExpandTrigger="<c-e>"
" " let g:UltiSnipsJumpForwardTrigger="<c-e>"
" " let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" " let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" " silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" " augroup ultisnips_no_auto_expansion
" "     au!
" "     au VimEnter * au! UltiSnips_AutoTrigger
" " augroup END
" 
" 
" 
" " ===
" " === vimtex
" " ===
" "let g:vimtex_view_method = ''
" let g:vimtex_view_general_viewer = 'llpp'
" let g:vimtex_mappings_enabled = 0
" let g:vimtex_text_obj_enabled = 0
" let g:vimtex_motion_enabled = 0
" let maplocalleader=' '
" 
" 
" " ===
" " === vim-calendar
" " ===
" "noremap \c :Calendar -position=here<CR>
" noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" augroup calendar-mappings
" 	autocmd!
" 	" diamond cursor
" 	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
" 	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
" 	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
" 	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
" 	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
" 	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
" 	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
" 	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
" 	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
" 	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
" 	" unmap <C-n>, <C-p> for other plugins
" 	autocmd FileType calendar nunmap <buffer> <C-n>
" 	autocmd FileType calendar nunmap <buffer> <C-p>
" augroup END
" 
" 
" " ===
" " === vim-go
" " ===
" let g:go_echo_go_info = 0
" let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_template_autocreate = 0
" let g:go_textobj_enabled = 0
" let g:go_auto_type_info = 1
" let g:go_def_mapping_enabled = 0
" let g:go_highlight_array_whitespace_error = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_chan_whitespace_error = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_format_strings = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_space_tab_error = 1
" let g:go_highlight_string_spellcheck = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_trailing_whitespace_error = 1
" let g:go_highlight_types = 1
" let g:go_highlight_variable_assignments = 0
" let g:go_highlight_variable_declarations = 0
" let g:go_doc_keywordprg_enabled = 0
" 
" 
" " ===
" " === AutoFormat
" " ===
" nnoremap \f :Autoformat<CR>
" let g:formatdef_custom_js = '"js-beautify -t"'
" let g:formatters_javascript = ['custom_js']
" au BufWrite *.js :Autoformat
" 
" 
" " ===
" " === OmniSharp
" " ===
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1
" 
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'ctrlp'
" 
" autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
" autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
" autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>
" 
" sign define OmniSharpCodeActions text=💡
" 
" augroup OSCountCodeActions
" 	autocmd!
" 	autocmd FileType cs set signcolumn=yes
" 	autocmd CursorHold *.cs call OSCountCodeActions()
" augroup END
" 
" function! OSCountCodeActions() abort
" 	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
" 	if !OmniSharp#IsServerRunning() | return | endif
" 	let opts = {
" 				\ 'CallbackCount': function('s:CBReturnCount'),
" 				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
" 				\}
" 	call OmniSharp#CountCodeActions(opts)
" endfunction
" 
" function! s:CBReturnCount(count) abort
" 	if a:count
" 		let l = getpos('.')[1]
" 		let f = expand('%:p')
" 		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
" 	endif
" endfunction
" 
" 
" " ===
" " === vim-easymotion
" " ===
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_do_shade = 0
" let g:EasyMotion_smartcase = 1
" " map ' <Plug>(easymotion-overwin-f2)
" " nmap ' <Plug>(easymotion-overwin-f2)
" "map E <Plug>(easymotion-j)
" "map U <Plug>(easymotion-k)
" "nmap f <Plug>(easymotion-overwin-f)
" "map \; <Plug>(easymotion-prefix)
" "nmap ' <Plug>(easymotion-overwin-f2)
" "map 'l <Plug>(easymotion-bd-jk)
" "nmap 'l <Plug>(easymotion-overwin-line)
" "map  'w <Plug>(easymotion-bd-w)
" "nmap 'w <Plug>(easymotion-overwin-w)
" 
" 
" " ===
" " === goyo
" " ===
" map <LEADER>gy :Goyo<CR>
" 
" 
" " ===
" " === jsx
" " ===
" let g:vim_jsx_pretty_colorful_config = 1
" 
" 
" " ===
" " === fastfold
" " ===
" " nmap zuz <Plug>(FastFoldUpdate)
" " let g:fastfold_savehook = 1
" " let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" " let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" " let g:markdown_folding = 1
" " let g:tex_fold_enabled = 1
" " let g:vimsyn_folding = 'af'
" " let g:xml_syntax_folding = 1
" " let g:javaScript_fold = 1
" " let g:sh_fold_enabled= 7
" " let g:ruby_fold = 1
" " let g:perl_fold = 1
" " let g:perl_fold_blocks = 1
" " let g:r_syntax_folding = 1
" " let g:rust_fold = 1
" " let g:php_folding = 1
" 
" 
" " ===
" " === tabular
" " ===
" vmap ga :Tabularize /
" 
" 
" " ===
" " === vim-after-object
" " ===
" autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" 
" 
" " ===
" " === rainbow
" " ===
" let g:rainbow_active = 1
" 
" 
" " ===
" " === xtabline
" " ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
" noremap \p :echo expand('%:p')<CR>
" 
" 
" " ===
" " === vim-session
" " ===
" "let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
" "let g:session_autosave = 'no'
" "let g:session_autoload = 'no'
" "let g:session_command_aliases = 1
" "set sessionoptions-=buffers
" "set sessionoptions-=options
" "noremap sl :OpenSession<CR>
" "noremap sS :SaveSession<CR>
" "noremap ss :SaveSession 
" "noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
" "noremap so :OpenSession default<CR>
" "noremap sD :DeleteSession<CR>
" ""noremap sA :AppendTabSession<CR>
" 
" 
" " ===
" " === context.vim
" " ===
" "let g:context_add_mappings = 0
" "noremap <leader>ct :ContextToggle<CR>
" 
" 
" " ===
" " === suda.vim
" " ===
" cnoreabbrev sudowrite w suda://%
" cnoreabbrev sw w suda://%
" 
" 
" " ===
" " === vimspector
" " ===
" let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r $HOME/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 $HOME/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
" 			\   'sink': function('<sid>read_template_into_buffer')
" 			\ })
" " noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad
" 
" 
" " ===
" " === reply.vim
" " ===
" "noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
" "noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
" "noremap <LEADER>rt :ReplStop<CR>


" " ===
" " === rnvimr
" " ===
" let g:rnvimr_ex_enable = 1
" let g:rnvimr_pick_enable = 1
" let g:rnvimr_draw_border = 0
" " let g:rnvimr_bw_enable = 1
" highlight link RnvimrNormal CursorLine
" nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
" let g:rnvimr_action = {
"             \ '<C-t>': 'NvimEdit tabedit',
"             \ '<C-x>': 'NvimEdit split',
"             \ '<C-v>': 'NvimEdit vsplit',
"             \ 'gw': 'JumpNvimCwd',
"             \ 'yw': 'EmitRangerCwd'
"             \ }
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': &columns,
"             \ 'height': &lines,
"             \ 'col': 0,
"             \ 'row': 0,
"             \ 'style': 'minimal' }
" let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
" 
" 
" " ===
" " === vim-subversive
" " ===
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" 
" 
" " ===
" " === vim-illuminate
" " ===
" let g:Illuminate_delay = 750
" hi illuminatedWord cterm=undercurl gui=undercurl
" 
" 
" " ===
" " === vim-rooter
" " ===
" let g:rooter_patterns = ['__vim_project_root', '.git/']
" let g:rooter_silent_chdir = 1
" 
" 
" " ===
" " === AsyncRun
" " ===
" noremap gp :AsyncRun git push<CR>
" 
" 
" " ===
" " === AsyncTasks
" " ===
" let g:asyncrun_open = 6
" 
" 
" " ===
" " === dart-vim-plugin
" " ===
" let g:dart_style_guide = 2
" let g:dart_format_on_save = 1
" let g:dartfmt_options = ["-l 100"]
" 
" 
" " ===
" " === tcomment_vim
" " ===
" nnoremap ci cl
" let g:tcomment_textobject_inlinecomment = ''
" nmap <LEADER>cn g>c
" vmap <LEADER>cn g>
" nmap <LEADER>cu g<c
" vmap <LEADER>cu g<
" 
" 
" " ===
" " === NrrwRgn
" " ===
" let g:nrrw_rgn_nomap_nr = 1
" let g:nrrw_rgn_nomap_Nr = 1
" noremap <c-y> :NR<CR>
" 
" 
" " ===
" " === any-jump
" " ===
" nnoremap j :AnyJump<CR>
" let g:any_jump_window_width_ratio  = 0.8
" let g:any_jump_window_height_ratio = 0.9


" " ===
" " === typescript-vim
" " ===
" let g:typescript_ignore_browserwords = 1

" " ===
" " === Agit
" " ===
" nnoremap <LEADER>gl :Agit<CR>
" let g:agit_no_default_mappings = 1

" " ===
" " === vim-translator
" " ===
" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>x <Plug>TranslateX


" ===================== End of Plugin Settings =====================

