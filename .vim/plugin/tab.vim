if exists('g:loaded_tab')
    finish
endif
let g:loaded_tab =1

"自动完成TAB键
let s:pats=['\k', '\.', '(', '>']
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
