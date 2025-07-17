""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS REFERENCE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" <space>             - Toggle fold under cursor
" <space> (visual)    - Create fold for selected text
" <leader>oo          - Unfold recursively
" W                   - Alias for :w (save)
" <leader>mm          - Open Markdown preview

" File Navigation
" <leader>ff          - Find files
" <leader>fg          - Live grep (search file contents)
" <leader>fb          - Browse buffers / file browser
" <leader>fh          - Search help tags
" <leader>o           - FZF all files including hidden (ignore node_modules, .git, venv)
" <C-n>               - Open Defx file explorer

" Editing
" <leader>/           - Toggle comment
" <leader>Z           - Run current Python file with python3
" <leader>z           - Run current Python file with pyenv

" Buffer Navigation
" <LocalLeader>[      - Previous buffer
" <LocalLeader>]      - Next buffer
" <LocalLeader>ww     - Close current buffer

" LSP - Code Navigation
" gd                  - Go to definition
" gr                  - Find references
" gi                  - Go to implementation  
" K                   - Show hover information
" <C-k>               - Show signature help

" LSP - Code Editing
" <leader>rn          - Rename symbol
" <leader>ca          - Code action
" <leader>f           - Format buffer
" <leader>nf          - Format with Neoformat

" LSP - Diagnostics
" <leader>e           - Show diagnostics in float window
" [d                  - Previous diagnostic
" ]d                  - Next diagnostic
" <leader>q           - Send diagnostics to location list

" Defx File Explorer (when open)
" <CR>                - Open file/toggle directory
" c                   - Copy file
" m                   - Move file
" p                   - Paste file
" l                   - Open file
" E                   - Open in vsplit
" P                   - Preview file
" o                   - Toggle directory
" K                   - Create directory
" N                   - Create file
" M                   - Create multiple files
" d                   - Delete
" r                   - Rename
" .                   - Toggle hidden files
" <Space>             - Toggle selection
" *                   - Toggle all selections
" h                   - Go to parent directory
" q                   - Close Defx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set lazyredraw
set updatetime=100
set noerrorbells
set noswapfile
set nobackup
set undodir=/tmp
set undofile
set shortmess+=c
set shortmess=I

" Enable mouse support if available
if has('mouse')
    set mouse=a
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber
set ruler
set t_Co=256
set cursorline
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=8 ctermfg=NONE
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
highlight Comment ctermfg=green

" TODO highlight
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME', -1)
augroup END

" Text wrapping
set textwidth=0
set wrapmargin=0
set wrap
set linebreak 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set hlsearch
set incsearch
set complete+=kspell
set completeopt=menuone,longest
set smarttab
set backspace=start,eol,indent

" indentation settings
filetype plugin indent on
filetype indent off
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent

" Fold settings (commented out by default)
" set foldmethod=indent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MANAGEMENT (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')
    " Colorscheme
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'olimorris/onedarkpro.nvim'
    Plug 'uloco/bluloco.nvim'
    Plug 'rktjmp/lush.nvim'
    
    " Language support & code quality
    Plug 'OmniSharp/omnisharp-vim'                          " C# support
    Plug 'Vimjas/vim-python-pep8-indent'                    " Python PEP8 indentation
    Plug 'lervag/vimtex'                                    " LaTeX support
    
    " Code editing helpers
    Plug 'tpope/vim-commentary'                             " Comment code
    Plug 'tpope/vim-surround'                               " Surround text objects
    Plug 'cohama/lexima.vim'                                " Auto-close pairs
    Plug 'alvan/vim-closetag'                               " Auto-close HTML tags
    Plug 'mattn/emmet-vim'                                  " HTML & CSS expansion
    Plug 'godlygeek/tabular'                                " Align text                                " Align text
    
    " Web development
    Plug 'pangloss/vim-javascript'                          " JavaScript support
    Plug 'elzr/vim-json'                                    " JSON support
    Plug 'MaxMEllon/vim-jsx-pretty'                         " JSX support
    Plug 'groenewege/vim-less', { 'for': 'less' }           " LESS support
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }    " CoffeeScript support
    
    " Git integration
    Plug 'tpope/vim-fugitive'                               " Git commands
    Plug 'tpope/vim-rhubarb'                                " GitHub integration
    
    " Writing & focus
    Plug 'junegunn/goyo.vim'                                " Distraction-free writing
    Plug 'junegunn/limelight.vim'                           " Focus on current paragraph
    Plug 'wellle/context.vim'                               " Show context of code
    
    " Neovim-specific plugins
    if has("nvim")
        " File management
        Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'kristijanhusak/defx-git'
        Plug 'kristijanhusak/defx-icons'
        Plug 'nvim-telescope/telescope-file-browser.nvim'
        
        " UI enhancements
        Plug 'vim-airline/vim-airline'                      " Status line
        Plug 'vim-airline/vim-airline-themes'
        Plug 'hoob3rt/lualine.nvim'
        Plug 'nvim-tree/nvim-web-devicons'
        
        " LSP and completion
        Plug 'neovim/nvim-lspconfig'
        Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
        Plug 'folke/lsp-colors.nvim'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'williamboman/mason.nvim'                      " Package manager for LSP servers
        Plug 'williamboman/mason-lspconfig.nvim'            " Mason integration with lspconfig
        Plug 'stevearc/conform.nvim'                        " Formatter integration
        Plug 'j-hui/fidget.nvim'                            " LSP progress notifications
        Plug 'b0o/schemastore.nvim'
        Plug 'L3MON4D3/LuaSnip'             " Snippet engine
        Plug 'saadparwaiz1/cmp_luasnip'     " Luasnip completion source
        Plug 'hrsh7th/cmp-path'             " Path completion
        Plug 'hrsh7th/cmp-cmdline'          " Command line completion
        " Plug 'github/copilot.vim'
        
        " Syntax and parsing
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
        
        " Fuzzy finding
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-telescope/telescope-fzy-native.nvim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        
        " Formatting and preview
        Plug 'sbdchd/neoformat'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    endif
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
nnoremap <space> za
vnoremap <space> zf
nnoremap <leader>oo zczA 

" Common command aliases
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Markdown preview
nnoremap <leader>mm <cmd>MarkdownPreview<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>fb <cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>

" FZF mapping
nnoremap <silent> <leader>o :All<cr>

" Commentary
noremap <leader>/ :Commentary<cr>

" Python execution mappings
nnoremap <leader>Z :w !python3 %<CR>
nnoremap <leader>z :execute "!source ~/.pyenv/versions/venv312/bin/activate.fish " . expand("%:p")<CR>

" Buffer navigation
nnoremap <silent> <LocalLeader>[ :bp<CR>
nnoremap <silent> <LocalLeader>] :bn<CR>
nnoremap <silent> <LocalLeader>ww :bd<CR>

" Defx file explorer
nnoremap <C-n> :Defx<cr>

" LSP mappings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>q <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.format({ async = true })<CR>

" Formatting
nnoremap <silent> <leader>nf :Neoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: DEFX CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ? defx#do_action('open_or_close_tree') :
    \ defx#do_action('multi', [['drop'], 'quit'])
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction

" Defx column configuration
call defx#custom#column('filename', {
      \ 'min_width': 10,
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

" Defx appearance
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:icon:space:indent:icons:space:filename:type:git:size:time',
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'root_marker': '@'
      \ })

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: AIRLINE CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#neomake#enabled = 0
let g:airline_skip_empty_sections = 1

let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: SPECIFIC CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo and Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" FZF configuration
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*,venv/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

" OmniSharp configuration
let g:OmniSharp_msbuild_exe_path = '/usr/local/share/dotnet'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1

" Python configuration
let g:python_pep8_indent_hang_closing = 0
let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:neoformat_enabled_python = ['black']
" let g:syntastic_python_checkers=['mypy']

" Markdown configuration
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" Neoformat configuration
let g:neoformat_try_node_exe = 1

" Surround configuration
let b:surround_{char2nr("%")} = "{% \r %}"

" JavaScript/JSX configuration
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" HTML/XML tags configuration
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js, *tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js, ts'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Markdown-Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMDS FOR LSP AND FORMATTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup lsp_format_on_save
"   autocmd!
"   " Format on save for specific filetypes
"   autocmd BufWritePre *.lua lua vim.lsp.buf.format()
"   autocmd BufWritePre *.py lua vim.lsp.buf.format()
"   autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.format()
" augroup END

" augroup lsp_document_highlight
"   autocmd!
"   " Highlight references when cursor holds position
"   autocmd CursorHold * lua vim.lsp.buf.document_highlight()
"   autocmd CursorMoved * lua vim.lsp.buf.clear_references()
" augroup END

colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" colorscheme onelight



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
----------------------------------
-- Package & LSP Server Setup
----------------------------------
-- Initialize formatters
require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    javascript = { "eslint" },
    typescript = { "eslint" },
    lua = { "stylua" }
  }
})

-- Set up Mason for LSP package management
require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Setup fidget for LSP progress
require('fidget').setup({
  notification = {
    window = {
      winblend = 0,
    },
  },
})


-- Treesitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { "python", "lua", "javascript", "typescript", "html", "css" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

----------------------------------
-- LSP Server Configuration
----------------------------------
-- Create capabilities with LSP and nvim-cmp integration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Define shared on_attach function for consistent experience
local on_attach = function(client, bufnr)
  -- Mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Highlight references on cursor hold if server supports it
  local function has_document_highlight(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/documentHighlight") then
        return true
      end
    end
    return false
  end

  -- Create autocmd group
  local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
  vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
  
  if has_document_highlight(bufnr) then
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      buffer = bufnr,
      group = group,
    })
    
    vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
      callback = function()
        vim.lsp.buf.clear_references()
      end,
      buffer = bufnr,
      group = group,
    })
  end

  vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
  vim.api.nvim_clear_autocmds { group = "lsp_document_highlight", buffer = bufnr }
  
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      if has_document_highlight() then
        pcall(vim.lsp.buf.document_highlight)
      end
    end,
    buffer = bufnr,
    group = "lsp_document_highlight",
  })
  
  vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
      if has_document_highlight() then
        pcall(vim.lsp.buf.clear_references)
      end
    end,
    buffer = bufnr,
    group = "lsp_document_highlight",
  })
end

-- Command to open current file in external editor (Cursor, PyCharm, WebStorm)
vim.api.nvim_create_user_command("OpenInIDE", function(opts)
  local ide = opts.args
  if ide == "" then
    print("Usage: OpenInIDE [cursor|pycharm|webstorm]")
    return
  end
  
  local file_path = vim.fn.expand("%:p")
  local line_number = vim.fn.line(".")
  local column_number = vim.fn.col(".")
  local cmd = ""
  
  if ide == "cursor" then
    -- Open in Cursor (Cursor CLI must be installed)
    cmd = string.format("cursor %s:%d:%d", file_path, line_number, column_number)
  elseif ide == "pycharm" then
    -- Open in PyCharm (assuming pycharm is in PATH)
    cmd = string.format("pycharm --line %d --column %d %s", line_number, column_number, file_path)
  elseif ide == "webstorm" then
    -- Open in WebStorm (assuming webstorm is in PATH)
    cmd = string.format("webstorm --line %d --column %d %s", line_number, column_number, file_path)
  else
    print("Unknown IDE: " .. ide)
    return
  end
  
  -- Execute the command
  vim.fn.jobstart(cmd, {
    detach = true,
    on_exit = function(_, code)
      if code ~= 0 then
        print("Failed to open in " .. ide .. ". Is it installed and in your PATH?")
      end
    end
  })
  
  print("Opening in " .. ide .. "...")
end, {nargs = "?", complete = function()
  return {"cursor", "pycharm", "webstorm"}
end})

-- Create convenient key mappings
vim.keymap.set('n', '<leader>oc', ":OpenInIDE cursor<CR>", {silent = true, noremap = true})
vim.keymap.set('n', '<leader>op', ":OpenInIDE pycharm<CR>", {silent = true, noremap = true})
vim.keymap.set('n', '<leader>ow', ":OpenInIDE webstorm<CR>", {silent = true, noremap = true})



-- Setup Mason-LSPConfig integration
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",     -- Lua
    "pyright",    -- Python
    "ts_ls",   -- TypeScript/JavaScript (fixed name)
    "eslint",     -- JS/TS linting
    "html",       -- HTML
    "cssls",      -- CSS
    "jsonls",     -- JSON
  },
  automatic_installation = true,
})

-- Configure each language server
local lspconfig = require('lspconfig')

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "use" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = { enable = false },
    }
  }
})

-- Python
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        venvPath = ".",  -- Look for virtual environments in the workspace
        extraPaths = {},
      }
    }
  }
})

-- Python environment detection
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Try to detect and set the python path
    local function find_venv()
      -- Check for active venv
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv
      end
      
      -- Check project directory for .venv
      local cwd = vim.fn.getcwd()
      local venv_path = cwd .. "/.venv"
      if vim.fn.isdirectory(venv_path) == 1 then
        return venv_path
      end
      
      return nil
    end
    
    local venv = find_venv()
    if venv then
      -- Set python path for this buffer
      vim.b.python_host_prog = venv .. "/bin/python"
      
      -- Inform Pyright about this environment
      local client = vim.lsp.get_clients({name = "pyright"})[1]
      if client then
        client.config.settings.python.pythonPath = venv .. "/bin/python"
        client.notify("workspace/didChangeConfiguration", {
          settings = client.config.settings
        })
        -- print("Python environment set to: " .. venv)
      end
    end

    local cmp = require('cmp')
    cmp.setup.buffer({
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        -- Explicitly exclude buffer source for Python
      })
    })
  end
})

-- TypeScript/JavaScript (fixed name)
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Disable formatting from ts_ls (we'll use ESLint)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
})

-- ESLint
lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Auto-fix on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- HTML
lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "templ" }
})

-- CSS
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


local cmp = require('cmp')
local has_luasnip, luasnip = pcall(require, 'luasnip')

-- Icons for completion menu
local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

-- Set up completion with conditional LuaSnip support
cmp.setup({
  snippet = {
    expand = function(args)
      if has_luasnip then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback() 
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif has_luasnip and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 1000 },
    { name = has_luasnip and 'luasnip' or nil, priority = 750 }, -- Fixed: use nil instead of ''
  }, {
    -- Fallback sources (only used when primary sources have no results)
    { name = 'buffer', priority = 500, keyword_length = 3 }, -- Added keyword_length to reduce noise
    { name = 'path', priority = 250 },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Add icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      
      -- Add source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[Path]",
      })[entry.source.name]
      
      -- Remove duplicates by truncating identical text
      vim_item.dup = 0
      
      return vim_item
    end
  },
  -- Add duplicate filtering
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  -- Improved duplicate handling
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  -- Enable experimental native completion
  experimental = {
    ghost_text = { hl_group = 'Comment' }, -- Better ghost text configuration
  },
})





-- Set up completion for command mode
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Add a command to manually set Python environment
vim.api.nvim_create_user_command("PythonSetEnv", function(opts)
  local path = opts.args
  if path == "" then
    -- If no argument provided, try to detect venv
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
      path = venv .. "/bin/python"
    else
      local cwd = vim.fn.getcwd()
      if vim.fn.isdirectory(cwd .. "/.venv") == 1 then
        path = cwd .. "/.venv/bin/python"
      else
        print("No virtual environment found. Please specify path.")
        return
      end
    end
  end
  
  -- Set it for both buffer and Pyright
  vim.b.python_host_prog = path
  
  local client = vim.lsp.get_clients({name = "pyright"})[1]
  if client then
    client.config.settings.python.pythonPath = path
    client.notify("workspace/didChangeConfiguration", {
      settings = client.config.settings
    })
    print("Python path set to: " .. path)
  else
    print("Pyright not active for this buffer")
  end
end, {nargs = "?", complete = "file"})

----------------------------------
-- Diagnostic Configuration
----------------------------------
-- Configure how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
    source = "if_many",
  },
  float = {
    source = "always",
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Define diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

----------------------------------
-- LSP UI Enhancements
----------------------------------
-- Add border to hover windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)

-- Add border to signature help
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
  }
)
EOF
