" 界面窗口管理
if exists('g:loaded_plugin_window')
    finish
endif

let g:loaded_plugin_window = 1

let g:miniBufExplMapCTabSwitchBufs=1        "通过<C-Tab>,<C-S-Tab>，在当前窗口切换buffer
                                            "但是在ubuntu 12.04中不可行，
                                            "我改成了<C-左右箭头>
let g:miniBufExplMapWindowNavVim=1          "通过<C-h,j,k,l>切换到上下左右的窗口。
"let g:miniBufExplMapWindowNavArrows=1       "通过<C-箭头>切换到上下左右的窗口

let g:persistentBehaviour = 0               " 只剩一个窗口时，退出vim

let g:winManagerWindowLayout='FileExplorer|TagList'
                                            " 打开两个窗口，依次为目录窗口，taglist窗口。
let Tlist_Show_One_File=1                   " 只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1                 " 在taglist是最后一个窗口时退出vim.


