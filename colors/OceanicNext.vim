" GUI color definitions
let s:gui00 = '152028' "{{{
let s:gui01 = '272E37'
let s:gui02 = '3E4954'
let s:gui03 = '52606C'
let s:gui04 = '969DAD'  
let s:gui05 = 'B3B8C4'  
let s:gui06 = 'C2C9D7'  " Light green (grey)
let s:gui07 = 'CFD6E4'  " Light blue (grey)
let s:gui08 = 'E74455'  " Red
let s:gui09 = 'F87C3D'  " Orange
let s:gui0A = 'F9BE44'  " Yellow
let s:gui0B = '87BF7F'  " Green
let s:gui0C = '4CA6A5'  " Turquoise
let s:gui0D = '5285C4'  " Blue
let s:gui0E = 'B97CBA'  " Purple
let s:gui0F = '9B6552'  " Brown
let s:guiWhite = 'ffffff' "}}}


if &background == "light" "{{{
  let s:gui0A = "9C8201"
  let s:gui0B = "70916C"
  let s:gui0C = "458282"
endif "}}}

" Terminal color definitions
let s:cterm00 = "00" "{{{
let s:cterm01 = "238"
let s:cterm02 = "239"
let s:cterm03 = "59"
let s:cterm04 = "145"
let s:cterm05 = "152"
let s:cterm06 = "188"
let s:cterm07 = "15"
let s:cterm08 = "203"
let s:cterm09 = "209"
let s:cterm0A = "221"
let s:cterm0B = "114"
let s:cterm0C = "73"
let s:cterm0D = "68"
let s:cterm0E = "176"
let s:cterm0F = "137"
let s:ctermWhite = "15" "}}}

let g:terminal_color_0='#1b2b34' "{{{
let g:terminal_color_1='#ed5f67'
let g:terminal_color_2='#9ac895'
let g:terminal_color_3='#fbc963'
let g:terminal_color_4='#669acd'
let g:terminal_color_5='#c695c6'
let g:terminal_color_6='#5fb4b4'
let g:terminal_color_7='#c1c6cf'
let g:terminal_color_8='#65737e'
let g:terminal_color_9='#fa9257'
let g:terminal_color_10='#343d46'
let g:terminal_color_11='#4f5b66'
let g:terminal_color_12='#a8aebb'
let g:terminal_color_13='#ced4df'
let g:terminal_color_14='#ac7967'
let g:terminal_color_15='#d9dfea'
let g:terminal_color_background='#1b2b34'
let g:terminal_color_foreground='#c1c6cf' "}}}

" Theme setup
hi clear
syntax reset
let g:colors_name = "OceanicNext"

if has("gui_running") || ( has("unix") && system("tput sitm") == "\033[3m" )
  let s:terminal_italic=1
else
  let s:terminal_italic=0
endif

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)" {{{
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun" }}}

" Return GUI color for light/dark variants
fun s:gui(color) "{{{
  if &background == "dark"
    return a:color
  endif

  if a:color == s:gui00
    return s:gui06
  elseif a:color == s:gui01
    return s:gui05
  elseif a:color == s:gui02
    return s:gui04
  elseif a:color == s:gui03
    return s:gui03
  elseif a:color == s:gui04
    return s:gui02
  elseif a:color == s:gui05
    return s:gui01
  elseif a:color == s:gui06
    return s:gui00
  elseif a:color == s:gui07
    return s:gui00
  endif

  return a:color
endfun "}}}

" Return terminal color for light/dark variants
fun s:cterm(color)" {{{
  if &background == "dark"
    return a:color
  endif

  if a:color == s:cterm00
    return s:cterm07
  elseif a:color == s:cterm01
    return s:cterm06
  elseif a:color == s:cterm02
    return s:cterm05
  elseif a:color == s:cterm03
    return s:cterm04
  elseif a:color == s:cterm04
    return s:cterm03
  elseif a:color == s:cterm03
    return s:cterm02
  elseif a:color == s:cterm06
    return s:cterm01
  elseif a:color == s:cterm07
    return s:cterm00
  endif

  return a:color
endfun" }}}

" Vim editor colors
call <sid>hi("Bold",          "", "", "", "", "bold") "{{{
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "")
call <sid>hi("FoldColumn",    "", s:gui01, "", s:cterm01, "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none")
call <sid>hi("Italic",        "", "", "", "", "none")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "")
call <sid>hi("MatchParen",    s:gui00, s:gui03, s:cterm00, s:cterm03,  "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Search",        s:gui03, s:gui0A, s:cterm03, s:cterm0A,  "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm03, "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("WildMenu",      s:guiWhite, s:gui0D, s:ctermWhite, s:cterm0D,  "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "")
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("CursorLineNR",  s:guiWhite, s:guiWhite, s:ctermWhite, s:ctermWhite, "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorLineNr",  s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("PMenu",         s:gui04, s:gui01, s:cterm04, s:cterm01, "none")
call <sid>hi("PMenuSel",      s:gui01, s:gui04, s:cterm01, s:cterm04, "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none") "}}}

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "") "{{{
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("Comment",      s:gui03, "", s:cterm03, "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none")
call <sid>hi("Include",      s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "")
call <sid>hi("Operator",     s:gui0C, "", s:cterm0C, "", "none")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("StorageClass", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "") "}}}

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "") "{{{
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "") "}}}

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "") "{{{
call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "") "}}}

" CSS highlighting
call <sid>hi("cssBraces",       s:gui05, "", s:cterm05, "", "") "{{{
call <sid>hi("cssClassName",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("cssDimensionProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssBackgroundProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssPositioningProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssBorderProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssFontProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssTextProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssBoxProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssColorProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssTransitionProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssUIProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssTransformProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssFlexibleBoxProp",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("cssColor",        s:gui0C, "", s:cterm0C, "", "") "}}}

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  s:cterm0B, s:cterm01, "") "{{{
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "")
call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "")
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "") "}}}

" Git highlighting
call <sid>hi("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "") "{{{
call <sid>hi("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "") "}}}

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "") "{{{
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "") "}}}

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "") "{{{
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "") "}}}

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "") "{{{
call <sid>hi("javaScriptBraces",  s:gui09, "", s:cterm09, "", "")
call <sid>hi("javaScriptClassName",       s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("javaScriptClassSuperName",  s:gui08, "", s:cterm08, "", "")
call <sid>hi("javaScriptEndColons",  s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("javaScriptIdentifier",      s:gui08, "", s:cterm08, "", "")
call <sid>hi("jsBlock",          s:gui05, "", s:cterm05, "", "")
" call <sid>hi("jsBraces",          s:gui09, "", s:cterm09, "", "")
call <sid>hi("jsArrowFunction",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsObjectBraces",    s:guiWhite, "", s:cterm09, "", "")
call <sid>hi("jsFunction",        s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsClassKeywords",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsClassDefinition", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsClassProperty",   s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsClassMethodType", s:gui05, "", s:cterm05, "", "")
call <sid>hi("jsReturn",          s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsModuleDefault",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsModuleKeywords",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsFuncName",        s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsDecorator",       s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsDecoratorFunction", s:gui08, "", s:cterm08, "", "")
"call <sid>hi("jsParens",          s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsFuncCall",        s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsStringS",         s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("jsSuper",           s:gui08, "", s:cterm08, "", "")
call <sid>hi("jsThis",           s:gui08, "", s:cterm08, "", "")
call <sid>hi("jsObjectKey",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("jsModules",         s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsModuleWords",     s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsModuleOperators", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsNoise",           s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsGlobalObjects",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "") "}}}

" JSX highlighting
call <sid>hi("jsxRegion",   s:gui08, "", s:cterm08, "", "") "{{{
call <sid>hi("xmlEndTag",   s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("xmlTag",      s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("xmlEqual",    s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("xmlAttrib",   s:gui0E, "", s:cterm0E, "", "italic")
call <sid>hi("xmlTagName",  s:gui08, "", s:cterm08, "", "")
call <sid>hi("xmlEndTagName", s:gui08, "", s:cterm08, "", "") "}}}

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "") "{{{
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "") "}}}

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "") "{{{
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "")
call <sid>hi("NERDTreeOpenable",  s:gui05, "", s:cterm05, "", "bold") "}}}

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "") "{{{
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "") "}}}

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "") "{{{
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "") "}}}

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "") "{{{
call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "") "}}}

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "") "{{{
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "") "}}}

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "") "{{{
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "") "}}}

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl") "{{{
call <sid>hi("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl") "}}}
hi CursorLineNR guifg=#ffffff
" Remove functions
delf <sid>hi
delf <sid>gui
delf <sid>cterm
" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
