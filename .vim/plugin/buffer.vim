if exists('g:loaded_buffer')
    finish
endif
let g:loaded_buffer = 1

let g:miniBufExplMapCTabSwitchBufs=1        "通过<C-Tab>,<C-S-Tab>，在当前窗口切换buffer
                                            "但是在ubuntu 12.04中不可行，
                                            "我改成了<C-左右箭头>
let g:miniBufExplMapWindowNavVim=1          "通过<C-h,j,k,l>切换到上下左右的窗口。
"let g:miniBufExplMapWindowNavArrows=1       "通过<C-箭头>切换到上下左右的窗口
