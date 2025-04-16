syntax enable

set tabstop=4

set softtabstop=4

set shiftwidth=4

set expandtab

set autoindent

set copyindent

set number

set clipboard+=unnamedplus

set relativenumber

let mapleader = " "

set encoding=UTF-8

set nowrap

set cursorline

set hidden

set ignorecase

set smartcase

set noshowmode

set mouse-=a

setlocal nobuflisted

xnoremap K :move '<-2<CR>gv-gv

xnoremap J :move '>+1<CR>gv-gv

vnoremap z <gv

vnoremap Z >gv

vnoremap < <gv

vnoremap > >gv

nmap <leader>w :w <CR>

nmap <leader>q :q <CR>

nmap <leader>e :Exit <CR>

nmap <leader>z :g/-z-/s//<>/g <CR>

nmap <leader>n :bnext <CR>

nmap <leader>b :bprevious <CR>

nmap <leader>t :T <CR>

" Add command neovim
command Py execute "!python %"

command Php execute "!php %"

command Js execute "!node %"

command Go execute "!go run %"

command W execute "w"

command T execute "split term://zsh"

command Exit execute "w | qa"

command Xdn execute "echo 'Lh=html Ldh=DjangoHtml Lds=DjangoSection Lbh=LaravelHtml Lbs=LaravelSection Ldevenv=NixDevenv Lnix=NixLayout Lgo=GoLayout Lrc=ReactComp'"

" Functions
function! ChangeValue( ... )
    execute printf('%%substitute/%s/%s/g', a:1, a:2)
endfunction

" Layouts

" HTML
command Lh execute "-1read $HOME/.config/nvim/.layouts/.layout_html.html"

" Django layout HTML
command Ldh execute "-1read $HOME/.config/nvim/.layouts/.layout_django.html"

" Django section HTML
command Lds execute "-1read $HOME/.config/nvim/.layouts/.layout_django_section.html"

" Laravel blade html
command Lbh execute "-1read $HOME/.config/nvim/.layouts/.layout_html.blade.php"

" Laravel blade section
command Lbs execute "-1read $HOME/.config/nvim/.layouts/.layout_section.blade.php"

" Nix-shell layout
command Lnix execute "-1read $HOME/.config/nvim/.layouts/.layout_shell.nix"

" Go main layout
command Lgo execute "-1read $HOME/.config/nvim/.layouts/.layout_goland_main.go"

" Nix Devenv layout
command Ldevenv execute "-1read $HOME/.config/nvim/.layouts/.layout_devenv.nix"

" React layout Component
command Lrc execute "-1read $HOME/.config/nvim/.layouts/.layout_react_ts.tsx"

" React Native layout Component
command Lrn execute "-1read $HOME/.config/nvim/.layouts/.layout_react_native.tsx"

" BashScript layout 
command Lbash execute "-1read $HOME/.config/nvim/.layouts/.layout_bash_script.sh"

" Close others buffers
command! Cb execute '%bdelete|edit #|normal `"'

" Change Values
command! -nargs=+ Cvalue call ChangeValue(<f-args>)

call plug#begin('~/.local/share/nvim/plugged')

Plug 'ayu-theme/ayu-vim'

Plug 'ryanoasis/vim-devicons'

Plug 'othree/html5.vim'

Plug 'mattn/emmet-vim'

Plug 'lnl7/vim-nix'

Plug 'tweekmonster/django-plus.vim'

Plug 'vim-scripts/Django-Projects'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'cocopon/iceberg.vim'

Plug 'gkeep/iceberg-dark'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'folke/tokyonight.nvim'

Plug 'bluz71/vim-nightfly-colors'

Plug 'rebelot/kanagawa.nvim'

Plug 'NLKNguyen/papercolor-theme'

Plug 'ellisonleao/gruvbox.nvim'

Plug 'Mofiqul/dracula.nvim'

Plug 'joshdick/onedark.vim'

Plug 'baliestri/aura-theme'

Plug 'rose-pine/neovim'

Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

Plug 'EdenEast/nightfox.nvim'

Plug 'doki-theme/doki-theme-vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-projectionist'

Plug 'noahfrederick/vim-composer'

Plug 'noahfrederick/vim-laravel'

Plug 'StanAngeloff/php.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

Plug 'jwalton512/vim-blade'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'nono/jquery.vim'

Plug 'tpope/vim-dotenv'

Plug 'hdima/python-syntax'

Plug 'arcticicestudio/nord-vim'

Plug '4513ECHO/vim-colors-hatsunemiku'

"Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

call plug#end()

"let g:deoplete#enable_at_startup = 1

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:minimap_width = 10

let g:minimap_auto_start = 1

let g:minimap_auto_start_win_enter = 1

let python_highlight_all = 1

let g:NERDTreeChDirMode = 2

map <F2> :NERDTreeToggle<CR>

map <F2><F2> :NERDTreeRefreshRoot<CR>

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowExpandable = ''

let g:NERDTreeDirArrowCollapsible = ''

let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1

set noshowmode

let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']

let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

nmap <Leader>s <Plug>(easymotion-s2)

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'

colorscheme catppuccin-mocha

let g:airline_theme = 'catppuccin'

let g:minimap_width = 10

let g:minimap_auto_start = 1

let g:minimap_auto_start_win_enter = 1

let g:minimap_block_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt']

let g:minimap_close_filetypes =	['startify', 'netrw', 'vim-plug']

let g:minimap_enable_highlight_colorgroup	= 1

"let g:javascript_plugin_jsdoc = 1

"let g:javascript_plugin_ngdoc = 1

"let g:javascript_plugin_flow = 1

"augroup javascript_folding
    "au!
    "au FileType javascript setlocal foldmethod=syntax
"augroup END

"let g:javascript_conceal_function = "ƒ"

"let g:javascript_conceal_null = "ø"

"let g:javascript_conceal_this = "@"

"let g:javascript_conceal_return = "⇚"

"let g:javascript_conceal_undefined = "¿"

"let g:javascript_conceal_NaN = "ℕ"

"let g:javascript_conceal_prototype = "¶"

"let g:javascript_conceal_static = "•"

"let g:javascript_conceal_super = "Ω"

"let g:javascript_conceal_arrow_function = "⇒"

"let g:javascript_conceal_noarg_arrow_function = "🞅"

"let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:jsx_ext_required = 1

let g:jsx_pragma_required = 1

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
