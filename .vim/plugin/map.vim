if exists('g:loaded_map')
    finish
endif
let g:loaded_map =1

"<F8>打开或关闭taglist窗口
nnoremap <silent> <F8> :TlistToggle<CR>

"自动完成TAB键
let s:pats=['\k', '\.', '(', '>', '\/']
function InsertTabWrapper()
    let col=col('.')-1
    let str=getline('.')[col-1]
    if col
        for pat in s:pats
            if str =~ pat
                return "\<C-N>"
            endif
        endfor
    endif
    return "\<TAB>"
endfunction
"将InsertTabWrapper映射到TAB上
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
