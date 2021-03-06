set nocompatible
filetype on 
filetype indent on
filetype plugin on 
filetype plugin indent on
set number
set nocompatible
syntax on
set showcmd
set wildmenu
set encoding=utf-8
set t_Co=256
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
set cursorline
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set laststatus=2
set ruler
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamedplus
set scrolloff=5
set nobackup
set nowb
set noswapfile
set relativenumber
let mapleader = "\<space>"

nnoremap <esc><esc> :nohlsearch<return><esc>

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" theme
Plug 'morhetz/gruvbox'

" Snazzy
" Plug 'connorholyday/vim-snazzy'

" coc-nvim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-indent-guide
Plug 'yggdroot/indentline'

" startify
"Plug 'mhinz/vim-startify'

" fuzzy search
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" surround
Plug 'tpope/vim-surround'

" repeat
Plug 'tpope/vim-repeat'

" undo-tree
Plug 'mbbill/undotree', {'on':'UndotreeToggle'}

" statusline
Plug 'itchyny/lightline.vim'

" tabline
Plug 'mg979/vim-xtabline'

" icons
Plug 'ryanoasis/vim-devicons'

" vista
Plug 'liuchengxu/vista.vim', {'on':'Vista'}

" register
"Plug 'junegunn/vim-peekaboo'

" floaterm
Plug 'voldikss/vim-floaterm' 

" yank highlight
Plug 'machakann/vim-highlightedyank'


call plug#end()

nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" snazzy-config
"let g:SnazzyTransparent = 1

colorscheme gruvbox
set background=dark

"lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" coc-config
let g:coc_global_extensions = ['coc-vimlsp', 'coc-clangd', 'coc-sh', 'coc-explorer', 'coc-pyright', 'coc-translator', 'coc-snippets', 'coc-pairs', 'coc-yank', 'coc-tabnine']

set hidden
set updatetime=100

" Tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <CR> to chose the completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc-explorer
nmap <space>e :CocCommand explorer<CR>

" coc-snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <leader>yc :CocCommand yank.clean <return>

" vim-translator
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>te <Plug>(coc-translator-e)
vmap <Leader>te <Plug>(coc-translator-ev)

" indentLine
let g:indentLine_color_term = 239

" LeaderF config
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2"  }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_ShortcutF = "<leader>ff"

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s",")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s",")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s",")<CR><CR>

" undo-tree
nnoremap <leader>u :UndotreeToggle<CR>

" vista config
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_cursor_delay = 300
let g:vista_sidebar_width = 24
nnoremap <leader>v :Vista<return>
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" floaterm keymap
let g:floaterm_keymap_new    = '<leader>on'
let g:floaterm_keymap_prev   = '<leader>ok'
let g:floaterm_keymap_next   = '<leader>oj'
let g:floaterm_keymap_toggle = '<leader>ot'
let g:floaterm_keymap_kill = '<leader>ok'

" xtabline
let g:xtabline_lazy = 1
let g:xtabline_settings = get(g:, 'xtabline_settings', {})
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']
" themes : monokai dracula 
let g:xtabline_settings.theme = 'monokai'

