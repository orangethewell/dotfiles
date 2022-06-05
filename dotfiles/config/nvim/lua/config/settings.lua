vim.cmd([[ set encoding=utf8 ]])    -- UTF-8 encoding
vim.cmd([[ set nu! ]])              -- Line Numbers
vim.cmd([[ set mouse=a ]])          -- Activate mouse support
vim.cmd([[ set wildmenu ]])         -- Complete menu (commands) shown on a line bellow buffer
vim.cmd([[ set confirm ]])          -- Ask to close or save file
vim.cmd([[ set hlsearch ]])         -- Highlight search
vim.cmd([[ set incsearch ]])        -- Search in runtime
vim.cmd([[ set title ]])            -- Change terminal title
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set laststatus=3 ]]) -- statusline. (or 3 for global line) 
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set guicursor= ]])       -- Change cursor style
vim.cmd([[ syntax on ]])            -- Colorize syntax
vim.cmd([[ set autoindent ]])       -- Automatic tabbing/indentation
vim.cmd([[ set bg=dark ]])          -- Set background theme
vim.cmd([[ set termguicolors ]])    -- Set gui colors
vim.cmd([[
  let g:onedark_config = {
    \ 'style': 'darker',
  \}
  colorscheme onedark
]]) -- Set theme as (OneDark)

-- Key mappings
-- Save file in any mode (Ctrl+S);
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

vim.cmd([[map q :q<CR>]])          -- Quit with "q";
-- Select everything with Ctrl+A;
vim.cmd([[ map <C-a> ggVG ]])
vim.cmd([[ map <C-t> :Telescope<CR> ]])

vim.cmd([[ nnoremap <silent>[b :BufferLineCycleNext<CR> ]])
vim.cmd([[ nnoremap <silent>b] :BufferLineCyclePrev<CR> ]])
vim.cmd([[ map <M-Tab> :bnext<CR> ]])
vim.cmd([[ map <S-Tab> :bprevious<CR> ]])

-- Autoupdate Packer.nvim
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Status line var
vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[ 
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
set signcolumn=yes
]])
