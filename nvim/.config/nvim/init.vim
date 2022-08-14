set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" automatically source .vimrc if there's on in current directory
set exrc
" block instead of thin line
"set guicursor=
set relativenumber
" show line number
set nu
set nohlsearch
" keep any buffer you've been editing it in the background
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
" unsure what these 2 do...
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes

set mouse=a "enable mouse
set clipboard+=unnamed,unnamedplus "use system clipboard

set iskeyword+=-

" show spaces as dots
"set lcs+=space:·
"set list

" global status line for cleaner splits
set laststatus=3

call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'gruvbox-community/gruvbox'

" TODO: potentially replace with newer Navigator Plugin
Plug 'christoomey/vim-tmux-navigator'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" TODO: This one needs additional telescope settings to work
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" harpoon
Plug 'ThePrimeagen/harpoon'

" LSP
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Used for Typescript
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Debugger
Plug 'mfussenegger/nvim-dap'

" Mason
Plug 'williamboman/mason.nvim',
Plug 'williamboman/mason-lspconfig.nvim',
call plug#end()


" jk to exit insert mode
inoremap jk <ESC>
inoremap kj <ESC>
inoremap jj <ESC>
inoremap kk <ESC> 

let mapleader = " "

" format on save
lua <<EOF
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
EOF

" Telescope key bindings
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>gf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>lg :lua require('telescope.builtin').live_grep()<CR>

lua require("user")

colorscheme gruvbox
highlight Normal guibg=none
highlight NonText guibg=none
