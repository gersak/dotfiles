set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "gersak"

" {{{ General colors
hi       Normal ctermfg=0     ctermbg=255 guibg=#002c47 guifg=#7affe2
hi       Cursor ctermfg=239    ctermbg=15 guibg=#ff1100 guifg=#444454
hi       Visual ctermfg=15     ctermbg=61 guibg=#FFFFFF guifg=#3465a3
hi    VisualNOS ctermfg=15     ctermbg=24 guibg=#FFFFFF guifg=#204a87
hi       Search ctermfg=236   ctermbg=228 guibg=#91ff82 guifg=#000000 cterm=underline      gui=underline
hi       Folded ctermfg=8      ctermbg=15 guibg=#808080 guifg=#ECECEC gui=bold           cterm=bold
hi        Title ctermfg=167 guifg=#91ff82
hi   StatusLine ctermfg=238   ctermbg=250 guibg=#00d4e8 guifg=#3e304f gui=bold           cterm=bold
hi StatusLineNC ctermfg=238   ctermbg=252 guibg=#002c47 guifg=#007ca3 gui=italic       cterm=italic
hi    VertSplit ctermfg=250   ctermbg=250 guibg=#002c47 guifg=#d9f7ff gui=none           cterm=none
hi       LineNr ctermfg=246    ctermbg=15 guibg=#002c47 guifg=#00638d gui=bold           cterm=bold
hi CursorLineNr ctermfg=246    ctermbg=15 guibg=#002c47 guifg=#d9dfe3 gui=bold           cterm=bold
hi   SpecialKey ctermfg=6   guifg=#177F80 gui=italic     cterm=italic
hi   WarningMsg ctermfg=167 guifg=#ef5939
hi     ErrorMsg ctermbg=15    ctermfg=196 guibg=#000000 guibg=#ff1100 gui=undercurl cterm=undercurl
hi  ColorColumn ctermbg=254 guifg=#e4e4e4
" }}}

" {{{ Vim => 7.0 specific colors
if        version >=                    700
    hi CursorLine ctermbg=0   guibg=#002c47 cterm=underline 
    hi MatchParen ctermfg=0     ctermbg=252 guibg=#000000   guifg=#ff1100 gui=underline cterm=underline
    hi      Pmenu ctermfg=15      ctermbg=8 guibg=#ffffff   guifg=#808080 gui=bold           cterm=bold
    hi   PmenuSel ctermfg=0     ctermbg=252 guibg=#000000   guifg=#ABFFE3 gui=italic       cterm=italic
    hi  PmenuSbar ctermfg=238     ctermbg=0 guibg=#444444   guifg=#000000
    hi PmenuThumb ctermfg=248   ctermbg=248 guibg=#aaaaaa   guifg=#aaaaaa
endif
" }}}

" {{{ Diff highlighting
hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
hi DiffChange ctermbg=255  guibg=#ececec gui=none   cterm=none
hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none
" }}}

" {{{ Syntax highlighting
hi      Special ctermfg=247   guifg=#f7fff5 gui=bold        cterm=bold
hi       Define ctermfg=247   guifg=#f7fff5 gui=bold        cterm=bold
hi       Ignore ctermfg=8     guifg=#9b84a1
hi   Identifier ctermfg=31    guifg=#f7fff5
hi      PreProc ctermfg=247   guifg=#f7fff5 gui=bold        cterm=bold
hi      Comment ctermfg=246   guifg=#786885
hi     Constant ctermfg=6     guifg=#c2e0ff gui=none        cterm=none
hi       String ctermfg=161   guifg=#c2e0ff
hi     Function ctermfg=88    guifg=#f7fff5
hi    Statement ctermfg=0     guifg=#7affe2 gui=bold        cterm=bold
hi         Type ctermfg=60    guifg=#838bb5 gui=bold        cterm=bold
hi       Number ctermfg=30    guifg=#c2e0ff 
hi         Todo ctermbg=15      ctermfg=196 guibg=#ff1100 guifg=#fffff gui=underline cterm=underline
hi        Label ctermfg=0     guifg=#FFFFFF gui=bold        cterm=bold
hi StorageClass ctermfg=0     guifg=#00d4e8 gui=bold        cterm=bold
hi    Structure ctermfg=0     guifg=#00d4e8 gui=bold        cterm=bold

hi  SpecialChar guifg=#ffce6d gui=bold


" {{{ Clojure
hi      Keyword ctermfg=0   guifg=#00d4e8
hi    Delimiter ctermfg=28  guifg=#00f1f7

" {{{ Links
hi! link FoldColumn Folded
hi! link CursorColumn   CursorLine
hi! link NonText    LineNr
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag         htmlEndTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
" }}}

au InsertLeave * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta guibg=#00d4e8
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta guibg=#91ff82

" {{{ Tabs
hi     TabLine ctermfg=238   ctermbg=188 guibg=#fdedff guifg=#3e304f gui=none
hi TabLineFill ctermfg=238   ctermbg=188 guifg=#fdedff guibg=#fdedff gui=none
hi  TabLineSel ctermfg=238 guifg=#fdedff gui=bold
" }}}

" {{{ Spelling
if has("spell")
    hi spellBad     guisp=#fcaf3e
    hi spellCap     guisp=#73d216
    hi spellRare    guisp=#fcaf3e
    hi spellLocal   guisp=#729fcf
endif
" }}}

