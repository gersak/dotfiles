"
unlet! skip_defaults_vim
" Vim 8 defaults
silent! source $VIMRUNTIME/defaults.vim


" let g:python_host_prog = '/usr/bin/pYthon' 
" let g:python3_host_prog = '/usr/bin/python3' 

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
,  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" set t_Co=256

" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

silent! if plug#begin('~/.vim/plugged')

" Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align',           { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf',                      { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


" Colors
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'cormacrelf/vim-colors-github'
Plug 'dracula/vim'
Plug 'arzg/vim-corvine'
Plug 'vim-scripts/Fruidle'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
" Plug 'pgavlin/pulumi.vim'
" Plug 'arzg/vim-colors-xcode'

" Git
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive', {'tag':'v3.2'}
" Plug 'airblade/vim-gitgutter'

" Edit
Plug 'brooth/far.vim'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-speeddating' 
Plug 'tpope/vim-sleuth' 
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }

" Navigation and autocomplete
Plug 'scrooloose/nerdtree'
" Plug 'justinmk/vim-dirvish'
Plug 'Shougo/deoplete.nvim',        { 'do': ':UpdateRemotePlugins' }

" Plug 'justinmk/vim-gtfo'
Plug 'sheerun/vim-polyglot'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Clojure
Plug 'guns/vim-sexp'
Plug 'jparise/vim-graphql'
Plug 'Olical/conjure', { 'tag': 'v4.9.0'}
" Plug 'Olical/conjure', { 'tag': 'v4.7.0'}
"
" Python
Plug 'vim-syntastic/syntastic'

" C#
Plug 'OmniSharp/omnisharp-vim'

" Colorizer
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-javascript'

" Others
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }
Plug 'jceb/vim-orgmode'

" Lint
" Plug 'metakirby5/codi.vim'
Plug 'dense-analysis/ale'

call plug#end()
endif

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

"
let mapleader      = '\'
let maplocalleader = '\'
" let mapleader = "\<Space>"
" let maplocaleader = "\<Space>"

" augroup vimrc
"   autocmd!
" augroup END
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set nu
" set cursorline!
" set nocursorline
set nonumber
" set relativenumber
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
" set nowrap
set sidescroll=1
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
" set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
" set completeopt=menuone,preview
set completeopt=menuone
set nrformats=hex
" silent! set cryptmethod=blowfish2
" let g:netrw_liststyle=3

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

if has('termguicolors')
  " echo 'Setting termguicolors'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ %f\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P

silent! if emoji#available()
  let s:ft_emoji = map({
    \ 'c':          'baby_chick',
    \ 'clojure':    'lollipop',
    \ 'coffee':     'coffee',
    \ 'cpp':        'chicken',
    \ 'css':        'art',
    \ 'eruby':      'ring',
    \ 'gitcommit':  'soon',
    \ 'haml':       'hammer',
    \ 'help':       'angel',
    \ 'html':       'herb',
    \ 'java':       'older_man',
    \ 'javascript': 'monkey',
    \ 'make':       'seedling',
    \ 'markdown':   'book',
    \ 'perl':       'camel',
    \ 'python':     'snake',
    \ 'ruby':       'gem',
    \ 'scala':      'barber',
    \ 'sh':         'shell',
    \ 'slim':       'dancer',
    \ 'text':       'books',
    \ 'vim':        'poop',
    \ 'vim-plug':   'electric_plug',
    \ 'yaml':       'yum',
    \ 'yaml.jinja': 'yum'
  \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:braille = split('"⠉⠒⠤⣀', '\zs')
  function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
  endfunction

  hi def link User1 TablineFill
  let s:cherry = emoji#for('cherry_blossom')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' %f %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
  endfunction

  " Note that the "%!" expression is evaluated in the context of the
  " current window and buffer, while %{} items are evaluated in the
  " context of the window that the statusline belongs to.
  set statusline=%!MyStatusLine()
endif

" set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

" For MacVim
set noimd
set imi=1
set ims=-1

" ctags
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" Shift-tab on GNU screen
" http://superuser.com/questions/195794/gnu-screen-shift-tab-issue
set t_kB=[Z

" set complete=.,w,b,u,t
set complete-=i

" mouse
" silent! set ttymouse=xterm2
" set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  " set colorcolumn=80
  set colorcolumn=0
endif

" Keep the cursor on the same column
set nostartofline

" FOOBAR=~/<CTRL-><CTRL-F>
set isfname-==

if exists('&fixeol')
  set nofixeol
endif

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

"  NERD Tree
" nnoremap <C-n> :NERDTreeFind<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nmap <Leader>nf :NERDTreeFind<cr>
let g:NERDTreeIgnore = ['^build$','^node_modules$']

"  Tagbar
nnoremap <silent>tt :TagbarToggle<cr>
let g:tagbar_sort = 0


" Movement in insert mode
" inoremap <C-h> <C-o>h
" inoremap <C-l> <C-o>a
" inoremap <C-j> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-^> <C-o><C-^>

tnoremap <Esc><Esc> <c-\><c-n>

" Completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap qq q
nnoremap q <Esc>
inoremap qq <Esc>
nnoremap Q @q

" Last inserted text
nnoremap g. :normal! `[v`]<cr><left>

" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>

" ----------------------------------------------------------------------------
" Readline-style key bindings in command-line (excerpt from rsi.vim)
" ----------------------------------------------------------------------------
cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
cnoremap        <M-b> <S-Left>
cnoremap        <M-f> <S-Right>
silent! exe "set <S-Left>=\<Esc>b"
silent! exe "set <S-Right>=\<Esc>f"

" " ----------------------------------------------------------------------------
" " <leader>bs | buf-search
" " ----------------------------------------------------------------------------
nnoremap <leader>bs :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

" " ----------------------------------------------------------------------------
" " #!! | Shebang
" " ----------------------------------------------------------------------------
" inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)


" " }}}
" " ============================================================================
" " FUNCTIONS & COMMANDS {{{
" " ============================================================================

" " ----------------------------------------------------------------------------
" " :Chomp
" " ----------------------------------------------------------------------------
" command! Chomp %s/\s\+$// | normal! ``

" " ----------------------------------------------------------------------------
" " :Count
" " ----------------------------------------------------------------------------
" command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/')) | normal! ``

" ----------------------------------------------------------------------------
" :CopyRTF
" ----------------------------------------------------------------------------
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

" ----------------------------------------------------------------------------
" Color scheme selector
" ----------------------------------------------------------------------------
function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <leader>cc :call <SID>rotate_colors()<cr>

" ----------------------------------------------------------------------------
" HL | Find out syntax group
" ----------------------------------------------------------------------------
function! s:hl()
  " echo synIDattr(synID(line('.'), col('.'), 0), 'name')
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
  endfunction
command! Todo call s:todo()

" ----------------------------------------------------------------------------
" EX | chmod +x
" ----------------------------------------------------------------------------
command! EX if !empty(expand('%'))
         \|   write
         \|   call system('chmod +x '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif

" ----------------------------------------------------------------------------
" Profile
" ----------------------------------------------------------------------------
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction
command! -bang Profile call s:profile(<bang>0)

" ----------------------------------------------------------------------------
" Common
" ----------------------------------------------------------------------------
function! s:textobj_cancel()
  if v:operator == 'c'
    augroup textobj_undo_empty_change
      autocmd InsertLeave <buffer> execute 'normal! u'
            \| execute 'autocmd! textobj_undo_empty_change'
            \| execute 'augroup! textobj_undo_empty_change'
    augroup END
  endif
endfunction

noremap         <Plug>(TOC) <nop>
inoremap <expr> <Plug>(TOC) exists('#textobj_undo_empty_change')?"\<esc>":''


" }}}
" ============================================================================
" PLUGINS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" vim-plug extension
" ----------------------------------------------------------------------------
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction

function! s:plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' doc
    endfor
  endif
endfunction

function! s:setup_extra_keys()
  " PlugDiff
  nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-j> <c-n>o
  nmap <silent> <buffer> <c-k> <c-p>o

  " gx
  nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>

  " helpdoc
  nnoremap <buffer> <silent> H  :call <sid>plug_doc()<cr>
endfunction

" autocmd vimrc FileType vim-plug call s:setup_extra_keys()

let g:plug_window = '-tabnew'
let g:plug_pwindow = 'vertical rightbelow new'

" ----------------------------------------------------------------------------
" MatchParen delay
" ----------------------------------------------------------------------------
let g:matchparen_insert_timeout=5

" ----------------------------------------------------------------------------
" vim-commentary
" ----------------------------------------------------------------------------
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>

" ----------------------------------------------------------------------------
" matchit.vim
" ----------------------------------------------------------------------------
runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" ack.vim
" ----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" if executable('ag')
"   let &grepprg = 'ag --nogroup --nocolor --column'
" else
"   let &grepprg = 'grep -rn $* *'
" endif
"
command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen

" ----------------------------------------------------------------------------
" vim-after-object
" ----------------------------------------------------------------------------
silent! if has_key(g:plugs, 'vim-after-object')
  autocmd VimEnter * silent! call after_object#enable('=', ':', '#', ' ', '|')
endif
" 
" ----------------------------------------------------------------------------
" <Enter> | vim-easy-align
" ----------------------------------------------------------------------------
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(EasyAlign)
" nmap gaa ga_

" xmap <Leader><Enter>   <Plug>(LiveEasyAlign)
" nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

" inoremap <silent> => =><Esc>mzvip:EasyAlign/=>/<CR>`z$a<Space>


" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#616161'

" ----------------------------------------------------------------------------
" vim-signify
" ----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']
let g:signify_skip_filetype = { 'journal': 1 }

" ----------------------------------------------------------------------------
" vim-slash
" ----------------------------------------------------------------------------
if has('timers')
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

" ----------------------------------------------------------------------------
" ALE
  " ----------------------------------------------------------------------------
let g:ale_linters = {'java': [], 'yaml': [], 'clojure':['clj-kondo']}
let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_lint_delay = 1000
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

" ----------------------------------------------------------------------------
" gv.vim / gl.vim
" ----------------------------------------------------------------------------
function! s:gv_expand()
  let line = getline('.')
  GV --name-status
  call search('\V'.line, 'c')
  normal! zz
endfunction

autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" ----------------------------------------------------------------------------
" clojure
" ----------------------------------------------------------------------------
function! s:lisp_maps()
  nnoremap <buffer> <leader>a[ vi[<c-v>$:EasyAlign *\ g/^\S/<cr>gv=
  nnoremap <buffer> <leader>a{ vi{<c-v>$:EasyAlign *\ g/^\S/<cr>gv=
  nnoremap <buffer> <leader>a( vi(<c-v>$:EasyAlign *\ g/^\S/<cr>gv=
  " nnoremap <buffer> <leader>rq :silent update<bar>Require<cr>
  " nnoremap <buffer> <leader>rQ :silent update<bar>Require!<cr>
  " nnoremap <buffer> <leader>rt :silent update<bar>RunTests<cr>
  " nmap     <buffer> <leader>*  cqp<c-r><c-w><cr>
  " nmap     <buffer> <c-]>      <Plug>FireplaceDjumpzz
  imap     <buffer> <c-j><c-n> <c-o>(<right>.<space><left><tab>
endfunction

function! s:countdown(message, seconds)
  for t in range(a:seconds)
    let left = a:seconds - t
    echom printf('%s in %d second%s', a:message, left, left > 1 ? 's' : '')
    redraw
    sleep 1
  endfor
  echo
endfunction

augroup vimrc
  " autocmd FileType lisp,clojure,scheme RainbowParentheses
  autocmd FileType lisp,clojure,scheme call <sid>lisp_maps()

  " Clojure
  " autocmd FileType clojure xnoremap <buffer> <Enter> :Eval<CR>
  " autocmd FileType clojure nmap <buffer> <Enter> cpp

augroup END

" let g:clojure_maxlines = 60
let g:clojure_maxlines =  300

set lispwords+=match
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:paredit_smartjump = 1

" ----------------------------------------------------------------------------
" vim-markdown
" ----------------------------------------------------------------------------
" let g:markdown_fenced_languages = ['sh', 'ruby', 'clojure', 'vim', 'java', 'gnuplot']

" ----------------------------------------------------------------------------
" splitjoin
" " ----------------------------------------------------------------------------
" let g:splitjoin_split_mapping = ''

" nnoremap gss :SplitjoinSplit<cr>
" nnoremap gsj :SplitjoinJoin<cr>


" ----------------------------------------------------------------------------
" YCM
" ----------------------------------------------------------------------------
" let g:ycm_auto_trigger=1


" ----------------------------------------------------------------------------
" Deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete = 'false'
let g:deoplete#complete_method = 'omnifunc'
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
call deoplete#custom#option('min_pattern_length', 5)
call deoplete#custom#option('auto_complete_delay', 500)


" let g:LanguageClient_serverCommands = {
"     \ 'clojure' : ['bash', '-c', 'clojure-lsp'],
"     \ }

" ----------------------------------------------------------------------------
" gruvbox
" ----------------------------------------------------------------------------
let g:gruvbox_contrast_dark = 'soft'


" }}}
" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent>  <expr>     <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent>  <Leader>C  :Colors<CR>
nnoremap <silent>  <C-f>      :BLines<cr>
nnoremap <silent>  <Leader>h  :Helptags<CR>
nnoremap <silent>  <Leader>t  :BTags<CR>
nnoremap <silent>; :Buffers<CR>
nnoremap <silent>  <Leader>ag :Ag       <CR>
nnoremap <silent>  <Leader>AG :Ag       <C-R><C-A><CR>
xnoremap <silent>  <Leader>ag y:Ag      <C-R>"<CR>
nnoremap <silent>  <Leader>`  :Marks<CR>

" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
 
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plugs_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source':  sort(keys(g:plugs)),
  \ 'sink':    function('s:plugs_sink')}))


" ----------------------------------------------------------------------------
" Help in new tabs
" ----------------------------------------------------------------------------
" function! s:helptab()
"   if &buftype == 'help'
"     wincmd T
"     nnoremap <buffer> q :q<cr>
"   endif
" endfunction
" autocmd vimrc BufEnter *.txt call s:helptab()


" }}}
" ============================================================================
" LOCAL VIMRC {{{
" ============================================================================
let s:local_vimrc = fnamemodify(resolve(expand('<sfile>')), ':p:h').'/vimrc-extra'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
" ============================================================================

" Gersak

nmap <silent> <Leader>8 :nohlsearch<cr>
nmap <C-t> :tabnew<cr>
nmap L :tabnext<cr>
nmap H :tabNext<cr>
nmap <C-up> :res +5<cr>
nmap <C-down> :res -5<cr>
nmap <C-left> :vertical resize -5<cr>
nmap <C-right> :vertical resize +5<cr>


set tabstop=2
set shiftwidth=2
set diffopt+=iwhite

" hi Search guibg='Purple' guifg='NONE'

set wildignore+=*/target/*,*/tmp/*,*.so,*.swp,*.zip,/.git     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,\\.git  " Windows


"
au BufNewFile,BufRead *.edn set filetype=clojure
au BufNewFile,BufRead *.edm set filetype=javascript
au BufNewFile,BufRead *.epm set filetype=javascript
au BufNewFile,BufRead *.bb set filetype=clojure
au BufNewFile,BufRead *.boot set filetype=clojure
let g:clojure_align_multiline_strings = 0
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defui,routes,fn,defhook,defnc,defstyled'
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def', '^let', '^with', '^reg-', '^register-',  '^om', '^dom', '^defui', '^fn']
let g:clojure_syntax_keywords = {
      \ 'clojureMacro': ["defhook", "defstyled", "defnc"],
      \ }

" Clojure test
autocmd FileType clojure setlocal lispwords+=describe,it
" Core.match
autocmd FileType clojure setlocal lispwords+=match
" Compojure-api
autocmd FileType clojure setlocal lispwords+=context,swaggered,middleware,context*
" Midje
autocmd FileType clojure setlocal lispwords+=fact,facts,provided,fact-group
" Core.logic
autocmd FileType clojure setlocal lispwords+=run*
" Cljs
autocmd FileType clojure setlocal lispwords+=this-as
" Plumbing
autocmd FileType clojure setlocal lispwords+=for-map,fnk,letk
" Core.async
autocmd FileType clojure setlocal lispwords+=go-loop
" Chesire
autocmd FileType clojure setlocal lispwords+=add-encoder
" Boot
autocmd FileType clojure setlocal lispwords+=with-call-in,with-eval-in,with-pre-wrap,with-post-wrap
" Cats
autocmd FileType clojure setlocal lispwords+=with-context,alet,mlet
" Dreamcatcher
autocmd FileType clojure setlocal lispwords+=defstm,set-stm!,update-data!
" Dreamcatcher
autocmd FileType clojure setlocal lispwords+=defhook,defstyled,defnc


" SHORTCUTS
" Clojure
" nmap <silent> <leader>r :Require<cr>
" nnoremap <leader>cr :Piggieback (adzerk.boot-cljs-repl/repl-env)<CR>
" nnoremap <leader>cn :Piggieback (cljs.repl.node/repl-env)<CR>
" nnoremap <leader>cs :Piggieback (shadow.cljs.devtools.api/nrepl-select )<CR>

" function! VimuxSlime()
"   call VimuxSendText(@v)
"   call VimuxSendKeys("Enter")
" endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
" vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
" nmap <LocalLeader>vs vip<LocalLeader>vs<CR>



" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
map s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
augroup END

let g:conjure_log_direction = "horizontal"
let g:conjure_quick_doc_normal_mode=v:false
let g:conjure_quick_doc_insert_mode=v:false
let g:conjure_log_auto_close=v:false
let g:conjure_fold_multiline_results=v:false
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval", "out", "error", "up"]



function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

let g:goyo_width=100

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


let g:golden_ratio_autocommand = 0
set lazyredraw

" colorscheme onehalfdark
" colorscheme PaperColor 
" colorscheme dracula
colorscheme gersak
" colorscheme rareshack
" colorscheme happy_hacking
" colorscheme OceanicNext
" colorscheme molokai
" colorscheme github
" colorscheme dracula
" colorscheme PaperColor
