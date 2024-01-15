" vim:sw=8:ts=8
"
" act like t_Co=0 but use (256) color on just a few things
"
hi clear
if exists("syntax_on")
        syntax reset
endif

let colors_name = "jcs"

hi Comment              cterm=NONE              ctermfg=7
hi Constant             cterm=underline         ctermfg=NONE
hi CursorLineNr         cterm=bold              ctermfg=15
hi DiffAdd              cterm=bold              ctermfg=NONE
hi DiffChange           cterm=bold              ctermfg=NONE
hi DiffDelete           cterm=bold              ctermfg=NONE
hi DiffText             cterm=reverse           ctermfg=NONE
hi Directory            cterm=bold              ctermfg=NONE
hi Error                cterm=NONE              ctermfg=NONE    ctermbg=9
hi ErrorMsg             cterm=NONE              ctermfg=NONE    ctermbg=9
hi FoldColumn           cterm=standout          ctermfg=NONE
hi Folded               cterm=standout          ctermfg=NONE
hi Identifier           cterm=underline         ctermfg=NONE
hi Ignore               cterm=bold              ctermfg=NONE
hi LineNr               cterm=NONE              ctermfg=8
hi MatchParen           cterm=reverse,bold      ctermfg=NONE    ctermbg=NONE
hi ModeMsg              cterm=bold              ctermfg=NONE
hi MoreMsg              cterm=bold              ctermfg=NONE
hi NonText              cterm=bold              ctermfg=NONE
hi PreProc              cterm=NONE              ctermfg=NONE
hi Question             cterm=standout          ctermfg=NONE
hi Search               cterm=reverse           ctermfg=15      ctermbg=NONE
hi IncSearch            cterm=reverse           ctermfg=15      ctermbg=NONE
hi SignColumn           cterm=NONE              ctermfg=NONE    ctermbg=NONE
hi SpellBad             cterm=NONE              ctermfg=NONE    ctermbg=9
hi SpellLocal           cterm=NONE              ctermfg=NONE    ctermbg=14
hi Special              cterm=bold              ctermfg=NONE
hi SpecialKey           cterm=bold              ctermfg=NONE
hi Statement            cterm=bold              ctermfg=NONE
hi StatusLine           cterm=reverse           ctermfg=NONE
hi StatusLineNC         cterm=bold,reverse      ctermfg=NONE
hi TabLine              cterm=reverse           ctermfg=NONE    ctermbg=NONE
hi Title                cterm=bold              ctermfg=NONE
hi Todo                 cterm=bold              ctermfg=NONE    ctermbg=NONE
hi Type                 cterm=bold              ctermfg=NONE
hi Underlined           cterm=NONE              ctermfg=NONE
hi VertSplit            cterm=reverse           ctermfg=NONE
hi Visual               cterm=reverse           ctermfg=NONE    ctermbg=NONE
hi VisualNOS            cterm=bold,underline    ctermfg=NONE
hi WarningMsg           cterm=standout          ctermfg=NONE
hi WildMenu             cterm=standout          ctermfg=NONE

hi Pmenu                cterm=NONE              ctermfg=7       ctermbg=NONE
hi PmenuSel             cterm=bold              ctermfg=NONE    ctermbg=8

hi ColorColumn          cterm=NONE              ctermfg=NONE    ctermbg=0

" for highlighting stray spaces/tabs (requires match statements in vimrc)
hi ExtraWhitespace      cterm=reverse           ctermfg=15      ctermbg=NONE

" mostly for nerdtree
hi VertSplit            cterm=bold              ctermfg=8       ctermbg=NONE
hi CursorLine term=bold cterm=bold guibg=Grey40
