if exists('g:loaded_plugin_map')
    finish
endif
let g:loaded_plugin_map =1

" <F7> 切换行号
nnoremap <silent> <F7> :call Nhz_toggle_number()<CR>
" <F8>打开或关闭winmanager
nnoremap <silent> <F8> :WMToggle<CR>

"切换显示行号/相对行号/不显示
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
