""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIMIZED NEOVIM CONFIGURATION
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
set mouse=a

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
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai
set si

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MANAGEMENT - OPTIMIZED WITH LAZY LOADING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')
    " Core (always loaded)
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " LSP & Completion (loaded on InsertEnter)
    Plug 'neovim/nvim-lspconfig', { 'on': [] }
    Plug 'mason-org/mason.nvim', { 'on': [] }
    Plug 'mason-org/mason-lspconfig.nvim', { 'on': [] }
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim', { 'on': [] }
    Plug 'nvimtools/none-ls.nvim', { 'on': [] }
    Plug 'hrsh7th/nvim-cmp', { 'on': [] }
    Plug 'hrsh7th/cmp-nvim-lsp', { 'on': [] }
    Plug 'hrsh7th/cmp-buffer', { 'on': [] }
    Plug 'hrsh7th/cmp-path', { 'on': [] }
    Plug 'L3MON4D3/LuaSnip', { 'on': [] }
    Plug 'saadparwaiz1/cmp_luasnip', { 'on': [] }
    Plug 'rafamadriz/friendly-snippets', { 'on': [] }
    
    " Telescope (lazy loaded)
    Plug 'nvim-telescope/telescope.nvim', { 'on': ['Telescope'] }
    Plug 'nvim-telescope/telescope-file-browser.nvim', { 'on': ['Telescope'] }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'on': ['FZF', 'All'] }
    Plug 'junegunn/fzf.vim', { 'on': ['FZF', 'All'] }
    
    " Treesitter (deferred)
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'on': [] }
    Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'on': [] }
    
    " Language specific (lazy by filetype)
    Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
    Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
    
    " Git
    Plug 'tpope/vim-fugitive'
    
    " On-demand tools
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> za
vnoremap <space> zf
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
noremap <leader>/ :Commentary<cr>
nnoremap <silent> <LocalLeader>[ :bp<CR>
nnoremap <silent> <LocalLeader>] :bn<CR>
nnoremap <silent> <LocalLeader>ww :bd<CR>

" Telescope (will lazy load)
nnoremap <silent> <leader>ff :Telescope find_files<cr>
nnoremap <silent> <leader>fg :Telescope live_grep<cr>
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>fh :Telescope help_tags<cr>
nnoremap <silent> <C-n> :Telescope file_browser path=%:p:h<cr>

" FZF fallback
nnoremap <silent> <leader>o :All<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE CONFIGURATION (SIMPLIFIED)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_skip_empty_sections = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFERRED LOADING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup load_insert_mode
  autocmd!
  autocmd InsertEnter * ++once call s:load_completion()
augroup END

function! s:load_completion()
  call plug#load(
        \ 'nvim-lspconfig',
        \ 'mason.nvim',
        \ 'mason-lspconfig.nvim',
        \ 'mason-tool-installer.nvim',
        \ 'none-ls.nvim',
        \ 'nvim-cmp',
        \ 'cmp-nvim-lsp',
        \ 'cmp-buffer',
        \ 'cmp-path',
        \ 'LuaSnip',
        \ 'cmp_luasnip',
        \ 'friendly-snippets')
  lua lsp_config()
endfunction

augroup load_treesitter
  autocmd!
  autocmd BufReadPost * ++once call timer_start(50, { -> s:load_treesitter() })
augroup END

function! s:load_treesitter()
  call plug#load('nvim-treesitter', 'nvim-treesitter-textobjects')
  lua treesitter_config()
endfunction

" FZF command
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*,venv/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

colorscheme catppuccin-mocha

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EMBEDDED LUA CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- Modern Neovim options
vim.g.do_filetype_lua = 1
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.timeoutlen = 300

-- LSP Configuration function
function _G.lsp_config()
  -- Mason setup
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls", "pyright", "ts_ls", "eslint", "html", "cssls", "jsonls"
    },
  })
  
  require("mason-tool-installer").setup({
    ensure_installed = {
      "black", "isort", "stylua", "prettier", "eslint_d", "ruff"
    },
  })
  
  -- Null-ls for formatting
  local null_ls = require("null-ls")
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.diagnostics.eslint_d,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
          end,
        })
      end
    end,
  })
  
  -- Enhanced on_attach
  local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    
    -- Inlay hints (Neovim 0.10+)
    if vim.lsp.inlay_hint and client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
    
    -- Code lens
    if client.supports_method("textDocument/codeLens") then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
    end
    
    -- LSP-based folding
    if client.supports_method("textDocument/foldingRange") then
      vim.wo[vim.api.nvim_get_current_win()].foldmethod = "expr"
      vim.wo[vim.api.nvim_get_current_win()].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
    
    -- Document highlight
    if client.supports_method("textDocument/documentHighlight") then
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end
  
  -- Python environment detection
  local function get_python_path(workspace)
    if vim.env.VIRTUAL_ENV then
      return vim.env.VIRTUAL_ENV .. "/bin/python"
    end
    local venv_paths = {".venv", "venv", ".env", "env"}
    for _, venv in ipairs(venv_paths) do
      local path = workspace .. "/" .. venv
      if vim.fn.isdirectory(path) == 1 then
        return path .. "/bin/python"
      end
    end
    return vim.fn.exepath("python3") or "python"
  end
  
  -- Configure LSP servers
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  
  -- Python
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    before_init = function(_, config)
      config.settings.python = {}
      config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        }
      }
    }
  })
  
  -- Lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
        hint = { enable = true },
      }
    }
  })
  
  -- TypeScript/JavaScript
  lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      on_attach(client, bufnr)
    end,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
        }
      }
    }
  })
  
  -- Other servers
  local servers = { "html", "cssls", "jsonls", "eslint" }
  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
  
  -- Completion setup
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  require("luasnip.loaders.from_vscode").lazy_load()
  
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
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
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 1000, max_item_count = 20 },
      { name = 'luasnip', priority = 750, max_item_count = 5 },
      { name = 'path', priority = 500 },
    }, {
      { name = 'buffer', priority = 250, keyword_length = 4, max_item_count = 5 },
    }),
    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.kind,
        cmp.config.compare.length,
      },
    },
    performance = {
      debounce = 60,
      throttle = 30,
      fetching_timeout = 500,
    },
  })
  
  -- Diagnostics
  vim.diagnostic.config({
    virtual_text = { prefix = '●' },
    float = { source = "always", border = "rounded" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
  
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

-- TreeSitter configuration
function _G.treesitter_config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "lua", "vim", "vimdoc", "python", "javascript", "typescript",
      "html", "css", "json", "yaml", "markdown", "bash"
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  })
  
  -- Enable Treesitter folding
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldlevelstart = 99
end

-- Telescope configuration (called on first use)
_G.TelescopeConfig = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  
  telescope.setup({
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/", "dist/", "__pycache__" },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
      },
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      },
    },
  })
  
  pcall(telescope.load_extension, 'file_browser')
end

-- Auto-load Telescope config on first use
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "*",
  callback = function()
    local cmd = vim.fn.getcmdline()
    if cmd:match("^Telescope") and not _G.telescope_loaded then
      _G.telescope_loaded = true
      TelescopeConfig()
    end
  end,
})
EOF
