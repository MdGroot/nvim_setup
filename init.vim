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
set cc=80                   " set an 80 column border for good coding style
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set termguicolors
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim  Directory to store backup files.
set shell=/usr/bin/fish
set path+=**                " Set the path to include the current directory and all subdirectories
let g:python3_host_prog = '/usr/bin/python3'
"let g:python3_host_prog='/home/maarten/.pyenv/versions/3.11.12/envs/exercises/bin/python3'
"vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
"let g:python3_host_prog= '/home/maarten/.virtualenvs/neovim/bin/python3'
let mapleader = '\'
let maplocalleader = '\'
" Configure the include search paths
set include=^\\s*#\\s*include
set includeexpr=substitute(v:fname,'^"\\|"$','','g')

inoremap jk <esc>
nnoremap mn <cmd>VimtexCompile<cr>
nnoremap tt <cmd>NvimTreeToggle<cr>
nnoremap mm <cmd>TodoTrouble<cr>
nnoremap ;; <cmd>TroubleToggle<cr>
nnoremap ,, <cmd>Trouble diagnostics toggle<cr>
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references()<cr>
nnoremap fb <cmd>Telescope buffers<cr>
" Codex
nnoremap <leader>cc <cmd>CodexToggle<CR>
tnoremap <leader>cc <C-\><C-n><cmd>CodexToggle<CR>

nnoremap <silent> <M-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <M-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <M-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <M-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR> nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>

nnoremap <silent> <M-;> <Cmd>bn<CR>
nnoremap <silent> <M-'> <Cmd>bp<CR>

" Enable tag navigation
set tags=./tags;,tags;

" Key mappings for tag navigation
nnoremap <silent> gd :tag <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> gD :tselect <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <C-]> :tag <C-R>=expand("<cword>")<CR><CR>

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin("~/.local/share/nvim/plugged")
 Plug 'johnseth97/codex.nvim'
 Plug 'Mofiqul/dracula.nvim'
 Plug 'SirVer/ultisnips'
 "Plug 'honza/vim-snippets'
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
" Plug 'dense-analysis/neural'
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
 "Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
 Plug 'epwalsh/obsidian.nvim'
 Plug 'williamboman/mason.nvim'
 Plug 'williamboman/mason-lspconfig.nvim'
 Plug 'chomosuke/typst-preview.nvim', { 'tag': 'v1.*' }
 "Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
 Plug '3rd/image.nvim'
" Plug 'benlubas/molten-nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'quarto-dev/quarto-nvim'
" Plug 'jmbuhr/otter.nvim'
" Plug 'GCBallesteros/jupytext.nvim'
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
 Plug 'echasnovski/mini.icons'
 Plug 'MeanderingProgrammer/render-markdown.nvim'
 Plug 'JuliaEditorSupport/julia-vim'
" Plug 'quarto-dev/quarto-nvim'
" Plug 'jmbuhr/otter.nvim'
" Plug 'GCBallesteros/jupytext.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
call plug#end()

let g:matlab_server_launcher = 'tmux' "launch the server in a tmux split
let g:matlab_auto_mappings = 0 "automatic mappings disabled

function! UploadArduino(board_type)
    execute '!tmux send-keys -t ArduinoDev:0.1 "/home/maarten/devel/upload_and_monitor.sh ' . a:board_type . '" C-m'
endfunction

command! -nargs=1 UploadArduino call UploadArduino(<f-args>)

filetype plugin indent on   " allow auto-indenting depending on file type
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
set conceallevel=1
let g:tex_conceal='abdmg'

syntax enable
lua require('nvim_tmux_navigation')
lua require('nvim_cmp')
lua require('telescope_conf')
"lua require('neural_conf')
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
lua require('obsidian_nvim_conf')
lua require('mason_conf')
lua require('typst-preview_conf')
lua require('nvim-treesitter_conf')
lua require('image_conf')
"lua require('quarto-nvim_conf')
"lua require('otter_conf')
"lua require('jupytext_conf')
lua require('markdown-preview_conf')
lua require('mini-icons_conf')
lua require('render-markdown_conf')
lua require('project-dir_conf')
"lua require('molten_conf') 
" .setup()

" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 1
" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0
" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = '/usr/bin/firefox'
" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''
" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or empty for random
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" use a custom location for images
let g:mkdp_images_path = '/home/maarten/.markdown_images'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'
" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0
" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1

let g:UltisnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<c-tab>"

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
