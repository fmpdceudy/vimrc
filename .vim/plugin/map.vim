" map映射{{{1
if exists('g:loaded_plugin_map')
    finish
endif
let g:loaded_plugin_map =1
" nmap{{{1
" <F2> 打开bufexplorer{{{2
noremap <silent> <F2> :BufExplorer<CR>
" <F7> 切换行号{{{2
nnoremap <silent> <F7> :call Nhz_toggle_number()<CR>
" <F8> 打开或关闭winmanager{{{2
nnoremap <silent> <F8> :WMToggle<CR>
" C-hjkl 切换window{{{2
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
" imap{{{1
" TAB补全{{{2
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 方向键{{{2
" For cursor moving in insert mode(Not recommended)
" 经测试是使用方向键移动鼠标时不弹出或关闭匹配列表
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" 函数{{{1
" 切换显示行号/相对行号/不显示{{{2
function Nhz_toggle_number()
        if &rnu
                setlocal nornu
                setlocal nolist
        elseif &nu
                setlocal rnu
        else
                setlocal list
                setlocal nu
        endif
endfunction
" Vim Modeline{{{1
" vim:set fdm=marker:
