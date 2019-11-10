set background=light

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "rareshack"

" {{{ General colors
" hi       Normal ctermfg=0     ctermbg=255 guifg=#000000 guibg=#ffffff
hi       Normal ctermfg=0     ctermbg=255 guifg=#000000 guibg=#fffff7
hi       Cursor ctermfg=239    ctermbg=15 guifg=#F8F8FF guibg=#444454
hi       Visual ctermfg=15     ctermbg=61 guifg=#FFFFFF guibg=#3465a3
hi    VisualNOS ctermfg=15     ctermbg=24 guifg=#FFFFFF guibg=#204a87
hi       Search ctermfg=236   ctermbg=228 guifg=#204a87 guibg=#e8e8e8 cterm=underline      gui=underline
hi       Folded ctermfg=8      ctermbg=15 guifg=#808080 guibg=#ECECEC gui=bold           cterm=bold
hi        Title ctermfg=167 guifg=#ef5939
hi   StatusLine ctermfg=238   ctermbg=250 guifg=#303030 guibg=#fffff7 gui=bold           cterm=bold
hi StatusLineNC ctermfg=238   ctermbg=252 guifg=#303030 guibg=#eeeeee  gui=italic       cterm=italic
hi    VertSplit ctermfg=250   ctermbg=250 guifg=#eeeeee guibg=#fffff7 gui=none           cterm=none
hi       LineNr ctermfg=246    ctermbg=15 guifg=#dddddd guibg=#fffff7 gui=bold           cterm=bold
hi   SpecialKey ctermfg=6   guifg=#177F80 gui=italic     cterm=italic
hi   WarningMsg ctermfg=167 guifg=#ef5939 guibg=#000000
hi     ErrorMsg ctermbg=15    ctermfg=196 guibg=#f8f8ff guifg=#ff1100 gui=undercurl cterm=undercurl
hi  ColorColumn ctermbg=254 guibg=#e4e4e4
" }}}

" {{{ Vim => 7.0 specific colors
if version >= 700
    hi CursorLine ctermbg=0       guibg=#fffff7 cterm=underline gui=underline
    hi MatchParen ctermfg=0     ctermbg=252 guifg=#000000 guibg=#ABFFE3 gui=underline cterm=underline
    hi      Pmenu ctermfg=15      ctermbg=8 guifg=#ffffff guibg=#808080 gui=bold     cterm=bold
    hi   PmenuSel ctermfg=0     ctermbg=252 guifg=#000000 guibg=#ABFFE3 gui=italic cterm=italic
    hi  PmenuSbar ctermfg=238     ctermbg=0 guifg=#444444 guibg=#000000
    hi PmenuThumb ctermfg=248   ctermbg=248 guifg=#aaaaaa guibg=#aaaaaa
endif
" }}}

" {{{ Diff highlighting
hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
hi DiffChange ctermbg=255  guibg=#ececec gui=none   cterm=none
hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none
" }}}

" {{{ Syntax highlighting
hi      Special ctermfg=247   guifg=#9400AB gui=bold         cterm=bold
hi       Define ctermfg=247   guifg=#9400AB gui=bold         cterm=bold
hi clojureDefine ctermfg=247   guifg=#9400AB gui=bold         cterm=bold
hi clojureMacro ctermfg=247   guifg=#0000FF gui=bold         cterm=bold
hi       Ignore ctermfg=8     guifg=#808080
" hi   Identifier ctermfg=31    guifg=#0086B3
hi   Identifier ctermfg=31    guifg=#007a00
hi      PreProc ctermfg=247   guifg=#9400AB gui=bold         cterm=bold
hi      Comment ctermfg=246   guifg=#c3c3c3
hi     Constant ctermfg=6     guifg=#0a63cf gui=none         cterm=none
" hi       String ctermfg=161   guifg=#007A00
hi       String ctermfg=161   guifg=#a30a29
hi     Function ctermfg=88    guifg=#0000FF
hi    Statement ctermfg=0     guifg=#9400AB gui=bold         cterm=bold
hi         Type ctermfg=60    guifg=#445588 gui=bold         cterm=bold
" hi       Number ctermfg=30    guifg=#0a63cf
hi       Number ctermfg=30    guifg=#0a63cf
hi         Todo ctermbg=15      ctermfg=196 guibg=#f8f8ff guifg=#ff1100 gui=underline cterm=underline
hi        Label ctermfg=0     guifg=#000000 gui=bold         cterm=bold
hi StorageClass ctermfg=0     guifg=#000000 gui=bold         cterm=bold
hi    Structure ctermfg=0     guifg=#000000 gui=bold         cterm=bold
hi      TypeDef ctermfg=0     guifg=#000000 gui=bold         cterm=bold
hi  SpecialChar guifg=#E68300 gui=bold


" {{{ Clojure
hi      Keyword ctermfg=0   guifg=#A30A29 
hi    Delimiter ctermfg=28  guifg=#7A5CFF
hi    clojureError ctermfg=0 guibg=#ff1100 guifg=#ffffff

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

" {{{ Tabs
hi TabLine ctermfg=238 ctermbg=188 guifg=#404040 guibg=#dddddd gui=none
hi TabLineFill ctermfg=238 ctermbg=188 guifg=#404040 guibg=#dddddd gui=none
hi TabLineSel   ctermfg=238 guifg=#404040 gui=bold
" }}}

" {{{ Spelling
if has("spell")
    hi spellBad     guisp=#fcaf3e
    hi spellCap     guisp=#73d216
    hi spellRare    guisp=#fcaf3e
    hi spellLocal   guisp=#729fcf
endif
" }}}

au InsertLeave * hi   StatusLine ctermfg=238 ctermbg=250 guifg=#404040 guibg=#bbbbbb gui=bold cterm=bold
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta guibg=#91ff82
