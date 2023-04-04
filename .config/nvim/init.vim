syntax on
set encoding=UTF-8
set lazyredraw
set number 
set relativenumber
set updatetime=100
set expandtab
set hlsearch
set ruler
set noerrorbells
set noswapfile
set nobackup
set undodir=/tmp
set undofile
set incsearch
set complete+=kspell
set completeopt=menuone,longest
set cursorline
set shortmess+=c
set shortmess=I
set t_Co=256
set smarttab
set cursorcolumn

hi CursorColumn cterm=NONE ctermbg=8 ctermfg=NONE
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE

" indents
filetype plugin indent on
filetype indent off
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" vimtex
filetype plugin indent on
syntax enable

if has('mouse')
    set mouse=a
endif

highlight Comment ctermfg=green

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME', -1)
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')

    Plug 'github/copilot.vim'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug 'wellle/context.vim'
    Plug 'ruby-formatter/rufo-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'cohama/lexima.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    " Plug 'vim-scripts/AutoComplPop'
    Plug 'alvan/vim-closetag'

    " javascript syntax
    Plug 'mattn/emmet-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'elzr/vim-json'
    Plug 'MaxMEllon/vim-jsx-pretty'

    " Django snippets
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'tweekmonster/django-plus.vim'

    " React snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'

    " Snippets of various languages
    " Plug 'honza/vim-snippets'
    " Plug 'hrsh7th/vim-vsnip'
    " Plug 'hrsh7th/vim-vsnip-integ'

    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

    Plug 'groenewege/vim-less', { 'for': 'less' }
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

    Plug 'godlygeek/tabular'
    Plug 'elzr/vim-json'
    " Plug 'plasticboy/vim-markdown'


    if has("nvim")
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'neoclide/coc-html'
        Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}

        Plug 'nvim-telescope/telescope-file-browser.nvim'
        Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'hoob3rt/lualine.nvim'
        Plug 'kristijanhusak/defx-git'
        Plug 'kristijanhusak/defx-icons'
        Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'neovim/nvim-lspconfig'
        Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
        Plug 'folke/lsp-colors.nvim'
    
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    
        "telescoping / fuzzyfinder
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-telescope/telescope-fzy-native.nvim'
        Plug 'nvim-tree/nvim-web-devicons'
        " Plug 'windwp/nvim-autopairs'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
    
        Plug 'sbdchd/neoformat'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    
        " nvim-cmp
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'onsails/lspkind-nvim'
    
        " For vsnip users.
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/vim-vsnip'
        
        " For luasnip users.
        Plug 'L3MON4D3/LuaSnip'
        Plug 'saadparwaiz1/cmp_luasnip'
        
        " For ultisnips users.
        Plug 'SirVer/ultisnips'
        Plug 'quangnguyen30192/cmp-nvim-ultisnips'
        Plug 'honza/vim-snippets'
        
        " For snippy users.
        " Plug 'dcampos/nvim-snippy'
        " Plug 'dcampos/cmp-snippy'
    endif
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W -> :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))


nnoremap <leader>mm <cmd>MarkdownPreview<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>fb <cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>

" fzf
nnoremap <silent> <leader>o :All<cr>

" vim-commentary
noremap <leader>/ :Commentary<cr>

" Python run
nmap \z :w !python3 <CR>

" coc djlint format
nnoremap <silent> <LocalLeader>djf :CocCommand htmldjango.djlint.format<CR>

" Buffer 
nnoremap <silent> <LocalLeader>[ :bp<CR>
nnoremap <silent> <LocalLeader>] :bn<CR>
nnoremap <silent> <LocalLeader>ww :bd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defx
nnoremap <C-n> :Defx<cr>
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

" Set appearance
call defx#custom#option('_', {
	      \ 'columns': 'mark:indent:icon:space:indent:icons:space:filename:type:git:size:time',
	      \ })

call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'root_marker': '@'
      \ })

" copilot
imap <silent><script><expr> <C-D> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" goyo + limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27#configuration
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*,venv/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

let g:python_pep8_indent_hang_closing = 0

" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

" Neoformat
let g:neoformat_try_node_exe = 1

" mypy
let g:syntastic_python_checkers=['mypy']

let b:surround_{char2nr("%")} = "{% \r %}"

" vim-jsx
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"vim-javascript
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Airline Config
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
" Lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
" https://github.com/Yoliani/YetAnotherNeovimConfig/blob/test/lua/plugins/cmp.lua
lua << EOF
local tabnine = require('cmp_tabnine.config')

local lspkind = require('lspkind')

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

require'cmp'.setup {
	sources = {
		{ name = 'cmp_tabnine' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	formatting = {
		format = function(entry, vim_item)
			-- if you have lspkind installed, you can use it like
			-- in the following line:
	 		vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
	 		vim_item.menu = source_mapping[entry.source.name]
	 		if entry.source.name == "cmp_tabnine" then
	 			local detail = (entry.completion_item.data or {}).detail
	 			vim_item.kind = ""
	 			if detail and detail:find('.*%%.*') then
	 				vim_item.kind = vim_item.kind .. ' ' .. detail
	 			end

	 			if (entry.completion_item.data or {}).multiline then
	 				vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
	 			end
	 		end
	 		local maxwidth = 80
	 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	 		return vim_item
	  end,
	},
}

EOF

