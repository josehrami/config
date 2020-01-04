execute pathogen#infect()

" Options
"set softtabstop=4       " 4-space tabs
set ai                  " set autoindenting on
set autowrite
set background=dark     " essentially makes highlighting all bold
set bs=2                " always allow backspacing in insert mode
set clipboard+=unnamed                      " Allow to use system clipboard
set cursorline "draws a horizontal highlight on the line your cursor is currently on
set completeopt+=noselect
set encoding=utf-8
set expandtab
set hidden
set ic                  " ignores case in searches
set incsearch           " searches as you type
set laststatus=2        " Always display a status line at the bottom of the window 
set nocompatible        " vim settings rather than vi settings
set nosmartindent
set number
set ruler               " always display cursor
set scrolloff=1         " minimum lines between cursor and window edge
set shell=/bin/zsh                          " Setting shell to zsh
set showcmd             " show commands while they're being typed
set showmatch           " shows matching parenthesis, bracket, or brace
set showmode            " displays mode in status line
set showtabline=2
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set smartcase           " match 'word' case-insensitive / 'Word' case-sensitive
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
set sw=2                " number of spaces to use for auto indent
set tabstop=2           " tabs is 2 spaces
set textwidth=79        " maximum line width
set title
set ttimeoutlen=50
set wildmenu            " visual autocomplete for command menu
set wrap
" Open files in the same directory as current buffer
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
" ,e <some-file> opens on this buffer. ,t and ,s do the same but on a new tab/split window

" Stop the stupid record window that I never use
map q: :q

" Short cut to save the current file
nnoremap <Leader>w :w<CR>

" Don't require shift-; to enter command mode
nore ; :

" highlight last inserted text
nnoremap gV `[v`]
" move to beginning/end of line
nnoremap B ^
nnoremap E $

filetype on
filetype indent on
filetype plugin on

" deoplete tab-completion
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" Automatically close scratch window on finishing a completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" If the terminal has colors turn on syntax highlighting
" Highlight the most recent search pattern
if &t_Co > 2 || has("gui_running") || has("nvim")
  syntax on
  set mouse=a
  colorscheme molokai
  set guifont=Consolas:h16
  hi Normal ctermbg=black

  " Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#max_menu_width=80
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#sources#go#use_cache = 1
  let g:deoplete#sources#go#pointer = 1
  let g:deoplete#sources#go#auto_goos = 1
  " let g:deoplete#sources#go#cgo = 1
  " let g:deoplete#sources#go#cgo#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
  let g:deoplete#sources#go#package_dot = 1

 " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
  call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

  set nohlsearch
endif

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" -----------------------------------------------------
" Airline settings {{{
" -----------------------------------------------------

let g:airline#extensions#branch#displayed_head_limit = 16
let g:airline#extensions#branch#format = 2
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['nerdtree', 'tagbar']
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0 
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_highlighting_cache = 0
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%3p%% %3l/%L'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#default#section_truncate_width = {
    \ 'z': 16,
\ }
let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'b', 'z', 'error', 'warning' ]
    \ ]
" let g:airline_theme="bubblegum"
" let g:airline_theme="molokai"
"}}}
"" -----------------------------------------------------
" Neovim settings {{{
" -----------------------------------------------------
if has("nvim")
  autocmd! BufWritePost * Neomake
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                   " Set an environment variable to use the t_SI/t_EI hack
  let g:loaded_python_provider=1                        " Disable python 2 interface
  let g:python_host_skip_check=1                        " Skip python 2 host check
  let g:python3_host_prog=systemlist('which python3')[0]      " Set python 3 host program
  set inccommand=nosplit                                " Live preview of substitutes and other similar commands

  if has('mouse_sgr')
    set ttymouse=sgr
  endif

  " In terminal buffer exit insert mode with just <ESC>
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
  " Automatically enter insert mode when switching to a terminal
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
endif

" -----------------------------------------------------
" Ack settings {{{
" -----------------------------------------------------

" Use ag instead of ack (it's 10x faster)
let g:ackprg = 'ag --nogroup --nocolor --column'
"}}}

" -----------------------------------------------------
" Neomake settings {{{
" -----------------------------------------------------
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
" Replace gometalinter via Neomake with gopls
let g:neomake_go_enabled_makers = [ 'go', 'golangci_lint' ]
" \   '-D', 'aligncheck',
  " \   '-D', 'dupl',
  " \   '-D', 'gocyclo',
  " \   '-D', 'gotype',
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--vendor',
  \   '--vendored-linters',
  \   '--fast',
  \   '-E', 'gosimple',
  \   '-E', 'misspell',
  \   '-E', 'staticcheck',
  \   '-E', 'testify',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }
"}}}

" -----------------------------------------------------
" NERDTree settings {{{
" -----------------------------------------------------

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeRespectWildIgnore=1
" map <C-n> T :NERDTreeToggle<CR>
nmap <leader>~ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" opens NERTree if vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"}}}


"------------------------------------------------------
" FZF key mapping
" -----------------------------------------------------
nmap <C-f> :FZF<CR>
" -----------------------------------------------------
" Easy motion settings {{{
" -----------------------------------------------------

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" }}}

" -----------------------------------------------------
" tagbar settings {{{
" -----------------------------------------------------
" nmap <C-\> :TagbarToggle<CR>
nmap <leader><Bar> :TagbarToggle<CR>
" }}}

" -----------------------------------------------------
" Gitgutter settings {{{
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'
"}}}


" -----------------------------------------------------
" vim-go settings {{{
" -----------------------------------------------------
" let g:go_term_enabled=1 " run commands in a terminal rather than the quickfix window
" let g:go_term_mode="split"
" let g:go_updatetime=1500
let g:go_fmt_command = "goimports" " use goimports rather than gofmt on save
" let g:go_highlight_operators  = 1
" guru is spewing errors so disabled
let g:go_info_mode="guru"
" let g:go_info_mode='gopls'
let g:go_add_tags_transform="snakecase"
let g:go_alternate_mode = "vsplit"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_decls_mode = 'fzf'
" let g:go_def_mode='gopls'
let g:go_fmt_fail_silently=1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters=1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"
let g:go_metalinter_command='golangci-lint'
let g:go_snippet_case_type = "camelcase"
let g:go_test_show_name = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <buffer> <leader>e <plug>(go-rename)
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)
autocmd FileType go nmap <buffer> <leader>d <plug>(go-describe)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>f :GoDecls<CR>
autocmd FileType go nmap <Leader>F :GoDeclsDir<CR>
" autocmd FileType go nmap <Leader>s :GoDefStack<CR>
autocmd FileType go nmap <Leader>p :GoChannelPeers<CR>

if has('nvim')
  au FileType go nmap <leader>rt <Plug>(go-run-tab)
  au FileType go nmap <Leader>rs <Plug>(go-run-split)
  au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
endif

nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"}}}

