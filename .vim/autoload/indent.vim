" LOAD GUARD {{{1

if exists('g:loaded_autoload_indent')
  finish
endif
let g:loaded_autoload_indent = 1

" }}}1
"=============================================================================
" GLOBAL FUNCTIONS: {{{1

"

function indent#enable()
    set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
    set smartindent     " 智能对齐方式
    set shiftwidth=4    " 换行时行间交错使用4个空格
    set autoindent      " 自动对齐
endfunction

" }}}1
"=============================================================================
" LOCAL FUNCTIONS: {{{1


" }}}1
"=============================================================================
" INITIALIZATION {{{1

" }}}1
"=============================================================================
" vim: set fdm=marker:
