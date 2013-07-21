
if exists('g:loaded_plugin_indent')
  finish
endif
let g:loaded_plugin_indent = 1

setlocal showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
setlocal smartindent     " 智能对齐方式
setlocal shiftwidth=4    " 换行时行间交错使用4个空格
setlocal autoindent      " 自动对齐

