set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
inoremap jk <esc>
set termguicolors
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim  Directory to store backup files.
set shell=/usr/bin/fish

nnoremap mn <cmd>VimtexCompile<cr>
nnoremap tt <cmd>NvimTreeToggle<cr>
nnoremap mm <cmd>TodoTrouble<cr>
nnoremap ;; <cmd>TroubleToggle<cr>
nnoremap ,, <cmd>TroubleToggle document_diagnostics<cr>
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>

 "Use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>

nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR> nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>


nnoremap <silent> <C-n> <Cmd>bn<CR>
nnoremap <silent> <C-m> <Cmd>bp<CR>


function! DoRemote(arg)
  UpdateRemotePlugins
endfunction



call plug#begin("~/.local/share/nvim/plugged")
 Plug 'Mofiqul/dracula.nvim'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug '~/.local/share/nvim/plugged/cif'
 Plug '~/.local/share/nvim/plugged/mcrl2'
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'feline-nvim/feline.nvim'
 Plug 'fgheng/winbar.nvim'
 Plug 'lewis6991/gitsigns.nvim'
 Plug 'neovim/nvim-lspconfig'
 Plug 'SmiteshP/nvim-navic'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'folke/trouble.nvim'
 Plug 'folke/lsp-colors.nvim'
 Plug 'folke/todo-comments.nvim'
 Plug 'lervag/vimtex'
 Plug 'dense-analysis/neural'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'
 Plug 'alexghergh/nvim-tmux-navigation'
 Plug 'tpope/vim-obsession'
" Plug 'BalderHolst/matlab.nvim'
" Plug 'daeyun/vim-matlab'
 Plug 'MdGroot/vim-matlab', { 'do': function('DoRemote') }
call plug#end()

let g:matlab_server_launcher = 'tmux' "launch the server in a tmux split
let g:matlab_auto_mappings = 0 "automatic mappings disabled

function! UploadArduino(board_type)
    execute '!tmux send-keys -t ArduinoDev:0.1 "/home/maarten/devel/upload_and_monitor.sh ' . a:board_type . '" C-m'
endfunction

command! -nargs=1 UploadArduino call UploadArduino(<f-args>)




lua require('nvim_tmux_navigation')
lua require('nvim_cmp')
lua require('telescope_conf')
lua require('neural_conf')
lua require('nvim_tree_conf')
lua require('nvim_web_devicons_conf')
lua require('winbar_conf')
lua require('gitsigns_conf')
lua require('obsession_conf')
lua require('nvim_navic_conf')
lua require('lspconfig_conf')
lua require('feline_conf')
lua require('dracula_conf')
lua require('trouble_conf')
lua require('lsp_colors_conf')
lua require('todo_comments_conf')


let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<c-tab>"

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
set conceallevel=1
let g:tex_conceal='abdmg'


syntax enable
"colorscheme dracula open new split panes to right and below
set splitright
set splitbelow

let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
