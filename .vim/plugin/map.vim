" map映射{{{1
if exists('g:loaded_plugin_map')
    finish
endif
let g:loaded_plugin_map =1
" nmap{{{1
" windows{{{2
" wb 打开bufexplorer{{{3
nnoremap <silent> wb :BufExplorer<CR>
" wf 打开Nerd{{{3
nnoremap <silent> wf :NERDTreeToggle<CR>
" wt 打开或关闭winmanager{{{3
nnoremap <silent> wt :WMToggle<CR>
" w-hjkl 切换window{{{3
nnoremap wj <C-W>j
nnoremap wk <C-W>k
nnoremap wh <C-W>h
nnoremap wl <C-W>l
" <F5> 根据文件类型检查或编译文件{{{2
nnoremap <expr> <silent> <F5> Fpeu_check()
" views{{{2
" en 切换行号{{{3
nnoremap <silent> en :call Fpeu_toggle_number()<CR>
" = 自动缩进全文{{{3
nnoremap <silent> = gg=G
" <space> 打开，关闭折叠{{{3
nnoremap <silent><space> @=(foldlevel('.')?'za':"\<space\>")<cr>
" tabs{{{2
" t-np 切换tab{{{3
nnoremap tn gt
nnoremap tp gT
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
" <space> 折叠选中行{{{2
vnoremap <silent> <space> zf
" 函数{{{1
" 切换显示行号/相对行号/不显示{{{2
function Fpeu_toggle_number()
    if &rnu && &nu
        setlocal nonu
        setlocal nornu
        setlocal nolist
    elseif &nu && !&rnu
        setlocal rnu
    else
        setlocal list
        setlocal nu
    endif
endfunction
" 根据文件类型检查或执行文件{{{2
function! Fpeu_check()
    if &filetype == 'php'
        return ":!clear;php -l %\<CR>"
    elseif &filetype == 'perl'
        return ":!clear;perl %\<CR>"
    else
        let project = eclim#project#util#GetCurrentProjectName()
        " this is a eclim project
        if project !=''
            return ":Ant\<CR>"
        else
            return
        endif
    endif
endfunction
" Vim Modeline{{{1
" vim:set fdm=marker:
