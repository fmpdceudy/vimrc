if exists('g:loaded_tab')
    finish
endif
let g:loaded_tab =1

"自动完成TAB键
function InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
"将InsertTabWrapper映射到TAB上
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
