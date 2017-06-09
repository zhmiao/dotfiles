" System Settings  ----------------------------------------------------------{{{

if has('nvim')
"  Neovim Settings
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors 
  set clipboard+=unnamedplus
endif

" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" ================ General Config ===================={{{
set cursorline
set splitbelow
set relativenumber number
set conceallevel=0
set noshowmode
set virtualedit=
set laststatus=2
set nowrap
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set scrolloff=15

set mouse =

set encoding=utf-8
set fileencoding=utf-8
" This makes vim act like all other editors, buffers can
set hidden

if &compatible
  set nocompatible endif
endif

filetype plugin indent on

" }}}

" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowb

" }}}

" ================ Persistent Undo ================== {{{
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
endif
" }}}

" ================ Search =========================== {{{

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set wildignorecase
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital }}}

" ================ Completion ======================= {{{

set wildmode=list:longest,full
set wildmenu                      "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*~ 
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=bk/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.out,*.o,*.mod
set wildignore+=*.pdf,*.fls,*.log,*.fdb_latexmk,*.blg,*.bbl,*.aux,*.synctex.gz
set wildignore+=*.Rhistory,*.RData,*.Rapp.history

"}}}

" ================ Indentation ====================== {{{

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" }}}

" ================ Fold ============================= {{{

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()
"
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set foldlevel=99
set nofoldenable    " No fold by default
set foldnestmax=10  " Deepest fold levels
autocmd FileType vim setlocal fdc=1
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

" }}}

autocmd BufRead,BufNewFile *.md,*.mkd,*.txt setlocal spell complete+=kspell 
autocmd BufNewFile,BufRead *.md,*.mkd,*.txt filetype indent off 
autocmd Bufreadpre *.md,*.mkd,*.txt set wrap linebreak nolist 

" }}}

" System mappings  ----------------------------------------------------------{{{

" For cursor movements
" let mapleader = ','
let mapleader = "\<Space>"
let maplocalleader = ";"
nnoremap ` .
nnoremap \ `
map <S-L> 20l
map <S-H> 20h
map j gj
map k gk
map <S-J> 10gj
map <S-K> 10gk
nnoremap <s-a> g$a
" inoremap <C-a> <C-O>A
nnoremap ! $
cnoremap <s-k> <up>
cnoremap <s-j> <down>

" Regularly used functions
nnoremap <LocalLeader>qq :b#<Bar>bd#<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>cd :cd 
nnoremap <Leader>pd :pwd<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <leader><tab> <c-^>
nnoremap <Leader>rl :so ~/.vimrc<CR>
map <Leader>qq :q<CR>
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>h :h 
nnoremap <Leader>o :e 
nnoremap <Leader>i :
map <Leader>s /
nnoremap <Leader>ma :make<CR>
inoremap jj <Esc>
imap <LocalLeader>f <S-tab>
nnoremap <Tab> za
nnoremap <LocalLeader><Tab> zM
nnoremap <Leader>z z=

" For line and space editing
nmap <CR> O<Esc>
nmap <CR><CR> o<Esc>
nmap <space><space> i<space><esc>

" For window resizing
noremap <up>    3<C-W>+
noremap <down>  3<C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" For global copy and paste
" map <C-P> "*p
" vmap <C-Y> "*y

" Neovim terminal mapping
if has ('nvim')
  nnoremap <leader>22 :pyf %<cr>
  nnoremap <leader>33 :py3f %<cr>
  tnoremap <Leader><esc> <c-\><c-n>
  tnoremap <s-k> <up>
  tnoremap <s-j> <down>
  autocmd TermOpen * nnoremap <buffer> <c-q> :bd!<cr>
  nnoremap <c-q> :15split<cr>:TmuxNavigateRight<cr>:terminal<cr>
  tnoremap <c-q> <c-\><c-n>:bd!<cr>
endif

" FZF 
"  nnoremap <Leader>f :FZF<CR>
"  nnoremap <leader>a :Ag<CR>

" Tab navigations
nmap <m-1> 1gt
nmap <m-2> 2gt
nmap <m-3> 3gt
nmap <m-4> 4gt
nmap <m-5> 5gt
nmap <m-6> 6gt
nmap <m-7> 7gt
nmap <m-8> 8gt
nmap <m-9> 9gt

"}}}

" Setup dein  ---------------------------------------------------------------{{{

  if (!isdirectory(expand("$HOME/.vim/dein")))
     call system(expand("mkdir -p $HOME/.vim/dein"))
     call system(expand("git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

  " Preload functions {{{
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
      exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
      exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif 

  function! UpdateSkim(status) "{{{
    if !a:status | return | endif
    let l:out = b:vimtex.out()
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
      call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
      call jobstart(l:cmd + [line('.'), l:out])
    elseif has('job')
      call job_start(l:cmd + [line('.'), l:out])
    else
      call system(join(l:cmd + [line('.'), shellescape(l:out)], ' '))
    endif
  endfunction "}}}

  " }}}

  " Plugin state {{{
  if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    " First, dein it self
    call dein#add('Shougo/dein.vim', {'rtp':''})
    
    " Python {{{
    call dein#add('hdima/python-syntax', {'on_ft': ['py'], 'hook_add':"let python_highlight_all = 1\n" })
    call dein#add('bfredl/nvim-ipy', {'on_ft': ['ipynb'], 'hook_add':"let g:nvim_ipy_perform_mappings = 0 \n map <silent> <c-e>   <Plug>(IPy-Run) \n" })
    " }}}

    " LaTex {{{
    call dein#add('lervag/vimtex', {'on_ft': ['tex'], 
          \ 'hook_source': "
          \ autocmd BufRead,BufNewFile *.tex setlocal spell complete+=kspell \n
          \ autocmd Bufreadpre *.tex setlocal wrap linebreak nolist \n", 
          \ 'hook_add': "
          \ let g:vimtex_complete_close_braces = 1 \n
          \ let g:vimtex_fold_enabled = 1 \n
          \ let g:vimtex_fold_manual = 1 \n
          \ let g:vimtex_fold_comments = 1 \n
          \ let g:vimtex_complete_img_use_tail = 1 \n
          \ let g:vimtex_quickfix_ignore_all_warnings = 1 \n
          \ let g:vimtex_latexmk_build_dir='./output/' \n
          \ let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline' \n
          \ let g:vimtex_view_general_options = '-r @line @pdf' \n
          \ let g:vimtex_latexmk_callback_hooks = 'UpdateSkim' \n
          \ let g:vimtex_fold_sections = [
          \      'part',
          \      'chapter',
          \      'section',
          \      'subsection',
          \      'subsubsection',
          \      'paragraph',
          \      'subparagraph',
          \      ] \n"
          \ })
    " }}}

    " csv {{{
    call dein#add('chrisbra/csv.vim', {'on_ft':['csv']})
    " }}}

    " R {{{
    call dein#add('jalvesaq/Nvim-R', {'on_ft': ['r','R','rmd'],
          \ 'hook_source': "autocmd bufreadpre *.r setlocal winheight=42 \n", 
          \ 'hook_add': "
          \ let R_hl_term = 1 \n
          \ let R_in_buffer = 1 \n
          \ let R_start_libs = 'raster,base,stats,graphics,grdevices,utils,methods' \n
          \ let Rout_more_colors = 1 \n
          \ let R_hi_fun = 1 \n
          \ let R_vsplit = 0 \n
          \ let R_rconsole_height = 3 \n
          \ let R_applescript = 1 \n
          \ vmap <localleader><space> <plug>RDSendSelection \n
          \ nmap <localleader><space> <plug>RDSendLine \n"
          \ })
    " }}}

    " Markdown {{{

    call dein#add('suan/vim-instant-markdown', {'on_ft':['md'], 
          \ 'hook_add': " 
          \ let g:instant_markdown_autostart = 0 \n"
          \ })
    
    call dein#add('plasticboy/vim-markdown', {'on_ft':['md'], 
          \ 'hook_add': " 
          \ let g:vim_markdown_folding_disabled = 0 \n
          \ let g:vim_markdown_math = 1 \n"
          \ })

    call dein#add('jtratner/vim-flavored-markdown', {'on_ft':['md']})
    " }}}
  
    " colorscheme & syntax highlighting {{{
    call dein#add('ranranking/Solarized_neovim_revised', {'hook_add':"colorscheme solarized \n syntax on \n set background=dark" })
    " }}}

    " indent line {{{
    call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle', 
          \ 'hook_add': "
          \ let g:indentLine_char='|' \n
          \ let g:indentLine_leadingSpaceChar = '+' \n
          \ let g:indentLine_enabled=0 \n
          \ let g:indentLine_leadingSpaceEnabled=0 \n
          \ nnoremap <M-w> :IndentLinesToggle<CR> \n"
          \})
    " }}}
    
    " delimitMate {{{
    call dein#add('Raimondi/delimitMate', {'on_i': 1})
    " }}}
  
    " Nerdtree {{{
    
    " NERDTress File highlighting

    call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle', 
          \ 'hook_source': function('NERDTreeHighlightFile'),
          \ 'hook_add': "
          \ map <Leader>nt :NERDTreeToggle<CR> \n
          \ let NERDTreeShowHidden=1 \n
          \ let NERDTreeMapOpenInTabSilent='t' \n
          \ let NERDTreeMapOpenInTab='T' \n
          \ autocmd StdinReadPre * let s:std_in=1 \n
          \ let g:NERDTreeWinSize=30 \n
          \ let g:NERDTreeAutoDeleteBuffer=1 \n
          \ let g:NERDTreeHighlightCursorline=1 \n
          \ let g:NERDTreeRespectWildIgnore=1 \n
          \ let g:NERDTreeIgnore=['\.o$', '\.mod$', '\.out$','\.git$','\.gitignore$'] \n
          \ call NERDTreeHighlightFile('f90', 'green', 'none', 'green', 'none') \n
          \ call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none') \n
          \ call NERDTreeHighlightFile('gr', 'yellow', 'none', '#d8a235', 'none') \n
          \ call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none') \n
          \ call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none') \n
          \ call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none') \n
          \ call NERDTreeHighlightFile('o', 'cyan', 'none', '#5486C0', 'none') \n
          \ call NERDTreeHighlightFile('mod', 'cyan', 'none', '#5486C0', 'none') \n
          \ call NERDTreeHighlightFile('r', 'Red', 'none', 'red', 'none') \n
          \ call NERDTreeHighlightFile('R', 'Red', 'none', '#ffa500', 'none') \n
          \ call NERDTreeHighlightFile('csv', 'Blue', 'none', '#6699cc', 'none') \n
          \ call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none') \n
          \ call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none') \n
          \ call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none') \n"
          \})
    " }}}
    
    " Switch {{{

    call dein#add('AndrewRadev/switch.vim', {'on_map':['<c-s>'], 
          \ 'hook_add': "
          \ let g:switch_mapping = '<C-s>' \n
          \ let g:switch_custom_definitions =
          \          [
          \            ['0', '1']
          \          ] \n" 
          \ })
    " }}}
    
    " Tmux navigator {{{
    call dein#add('christoomey/vim-tmux-navigator', {'on_cmd': ['TmuxNavigateDown','TmuxNavigateUp','TmuxNavigateRight','TmuxNavigateLeft'], 
          \ 'hook_add': "
          \ let g:tmux_navigator_no_mappings = 1 \n
          \ nnoremap <silent> <M-j> :TmuxNavigateDown<cr> \n
          \ nnoremap <silent> <M-k> :TmuxNavigateUp<cr> \n
          \ nnoremap <silent> <M-l> :TmuxNavigateRight<cr> \n
          \ nnoremap <silent> <M-h> :TmuxNavigateLeft<CR> \n
          \ nnoremap <silent> <M-;> :TmuxNavigatePrevious<cr> \n
          \ tmap <M-j> <C-\><C-n>:TmuxNavigateDown<cr> \n
          \ tmap <M-k> <C-\><C-n>:TmuxNavigateUp<cr> \n
          \ tmap <M-l> <C-\><C-n>:TmuxNavigateRight<cr> \n
          \ tmap <M-h> <C-\><C-n>:TmuxNavigateLeft<CR> \n
          \ tmap <M-;> <C-\><C-n>:TmuxNavigatePrevious<cr> \n" 
          \})
    " }}}
    
    " Lightline {{{
    call dein#add('itchyny/lightline.vim', {
          \ 'hook_add': "
          \ let g:lightline = {
          \ 'colorscheme': 'jellybeans',
          \ 'active': {
          \ 'left': [ [ 'mode', 'paste' ],
          \           [ 'readonly', 'modified' ],
          \           [ 'relativepath' ] ],
          \ 'right': [ [ 'percent' ],
          \            [ 'lineinfo' ],
          \            [ 'filetype' ] ] },
          \ 'inactive': {
          \ 'left': [ [ 'filename' ] ],
          \ 'right': [ [ 'lineinfo' ],
          \            [ 'percent' ],
          \            [ 'fileformat', 'fileencoding'] ] },
          \ 'subseparator': { 'left': '', 'right': '' }
          \} \n
          \ let g:lightline.enable = {
          \ 'statusline': 1 
          \} \n" 
          \})
    " }}}

    " Surround {{{
    call dein#add('tpope/vim-surround', {'on_map': ['<S-s>', 'c', 'd', 'y']})
    " }}}
    
    " Tcomment {{{
    call dein#add('tomtom/tcomment_vim', {'on_map': ['g','v']})
    " }}}
    
    " Coloresque {{{
    call dein#add('ranranking/vim-coloresque', {'on_ft':['vim', 'css', 'r', 'R']})
    " }}}
    
    " Tabular {{{
    call dein#add('godlygeek/tabular', {'on_map': ['v','c-v','V' ]})
    " }}}
    
    " QuickScope {{{
    " call dein#add('unblevable/quick-scope', {'on_cmd': 'QuickScopeToggle' })
    call dein#add('ranranking/quick-scope', {'on_map': ['f', 'F'], 
          \ 'hook_add': "
          \ let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] \n
          \ nmap <leader>a <plug>(QuickScopeToggle) \n
          \ vmap <leader>a <plug>(QuickScopeToggle) \n " 
          \ })
    " }}}
    
    " Shougo {{{
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimproc.vim', {
          \ 'build' : 'make -f make_mac.mak',
          \ 'on_source': 'unite.vim'})
    call dein#add('Shougo/neco-vim', {'on_source': 'deoplete.nvim'})
    call dein#add('ujihisa/neco-look', {'on_ft':['markdown', 'tex'], 'on_i': 1})

    call dein#add('Shougo/neosnippet.vim', {'on_i': 1, 
          \ 'hook_add': "
          \ let g:neosnippet#enable_snipmate_compatibility = 1 \n
          \ imap <m-q>     <Plug>(neosnippet_jump) \n
          \ smap <m-q>     <Plug>(neosnippet_jump) \n
          \ xmap <m-q>     <Plug>(neosnippet_expand_target) \n
          \ let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/.vim/my_snippets' \n
          \ let g:neosnippet#expand_word_boundary = 1 \n 
          \ imap <expr><M-Tab> pumvisible() ? 
		      \ neosnippet#expandable_or_jumpable() ?
		      \ '<Plug>(neosnippet_jump_or_expand)' : '\<C-n>' : deoplete#mappings#manual_complete()\n
          \ smap <expr><M-Tab> 
		      \ neosnippet#expandable_or_jumpable() ?
		      \ '<Plug>(neosnippet_jump_or_expand)' : deoplete#mappings#manual_complete()\n"
          \})
                 
    call dein#add('Shougo/neosnippet-snippets', {'on_i': 1})

    call dein#add('Shougo/deoplete.nvim', {'on_i': 1, 
          \ 'hook_add': "
          \ let g:deoplete#enable_at_startup=1 \n
          \ let g:deoplete#max_list=6 \n
	        \ inoremap <silent><expr> <Tab> 
	        \ 	 pumvisible() ? '\<C-n>' : '\<tab>'\n
          \ let g:deoplete#enable_smart_case=1 \n
          \ let g:deoplete#omni#input_patterns.tex =
          \        '\v\\%('
          \        . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
          \        . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
          \        . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
          \        . '|%(include%(only)?|input)\s*\{[^}]*'
          \        . ')' \n" 
          \ })
    " }}}

    call dein#end()
    call dein#save_state()
  endif

  " }}}

  if dein#check_install()
    call dein#install()
  endif

" }}}

" Fortran  ------------------------------------------------------------------{{{

  autocmd FileType fortran setlocal tw=0
  " autocmd FileType fortran set tw=0
  autocmd FileType fortran setlocal foldmethod=marker
  autocmd FileType fortran setlocal fdc=1
  autocmd FileType fortran setlocal foldlevel=0
  let fortran_free_source=1
  let fortran_have_tabs=1
  let fortran_more_precise=1
  let fortran_do_enddo=1

"}}}

" unite ---------------------------------------------------------------------{{{

  let g:unite_data_directory='~/.vim/.cache/unite'
  let g:unite_prompt='» '
  call unite#custom#source('file_rec/neovim', 'ignore_globs', split(&wildignore,','))  
  
  nnoremap <m-tab> :Unite -auto-resize -start-insert -sync -here buffer<CR>
  nnoremap <Leader>l :Unite -auto-resize -start-insert -complete -sync -here -smartcase line<CR>
  nnoremap <Leader>f :Unite -auto-resize -start-insert -here file_rec/neovim<CR>
  nnoremap <Leader>g :Unite -here grep:.<CR>
  nnoremap <silent> <leader>up :call dein#update()<CR>
  nnoremap <silent> <leader>ul :echo dein#get_log()<CR>
  nnoremap <silent> <leader>pc :call Show_Log_for_current_plugin()<CR>
  nnoremap <silent> <Leader>lt :<c-u>Unite vimtex_toc<CR>
  nnoremap <silent> <Leader>ly :<c-u>Unite vimtex_labels<CR>
  func! Show_Log_for_current_plugin()
    try
      exec "normal! ".'"ayi'."'"
      exec "call unite#start([['output/shellcmd',"
                      \ ."'git -C ~/.vim/dein/repos/github.com/"
                      \ . @a
                      \ . " log -n 6 --oneline']], {'log': 1, 'wrap': 1,'start_insert':0})"
    catch
      echohl WarningMsg | echomsg "can show logs of current plugin" | echohl None
    endtry
  endf 
  
  nnoremap <silent> <Leader>de :Unite -auto-resize -here dein<CR>
  nnoremap <silent> <Leader>ms :Unite -auto-resize -here output:message<CR>

" endif
