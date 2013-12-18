" map映射{{{1
if exists('g:loaded_plugin_map')
    finish
endif
let g:loaded_plugin_map =1
" jmap{{{1
" windows{{{2
" wb 打开bufexplorer{{{3
nnoremap <silent> wb :BufExplorer<CR>
" wf 打开Nerd{{{3
nnoremap <silent> wf :NERDTreeToggle<CR>
" wn 切换行号{{{3
nnoremap <silent> wn :call Nhz_toggle_number()<CR>
" wt 打开或关闭winmanager{{{3
nnoremap <silent> wt :WMToggle<CR>
" C-hjkl 切换window{{{3
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" = 自动缩进全文{{{2
nnoremap <silent> = gg=G
" tabs{{{2
" C-np 切换tab{{{3
nnoremap <C-N> gt
nnoremap <C-P> gT
" imap{{{1
" TAB补全和snippet跳转{{{2
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ (pumvisible() ? "\<C-n>" : "\<Plug>(neosnippet_expand_or_jump)")
            \: ( pumvisible() ? "\<C-n>" : "\<TAB>")
" snippet 选中和跳转{{{2
 imap <expr><C-k>     "\<Plug>(neosnippet_expand_or_jump)"
" 方向键{{{2
" For cursor moving in insert mode(Not recommended)
" 经测试是使用方向键移动鼠标时不弹出或关闭匹配列表
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" vmap{{{1
" 缩进选中行{{{2
vnoremap <silent> <F4> =
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
