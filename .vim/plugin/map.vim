" map映射{{{1
if exists('g:loaded_plugin_map')
    finish
endif
let g:loaded_plugin_map =1
" nmap{{{1
" windows{{{2
if nhz#Has_bundle( 'unite' ) "{{{3
    " wb 打开bufexplorer
    nnoremap <silent> wb :Unite buffer<CR>
endif
if nhz#Has_bundle( 'NERD' ) "{{{3
    " wf 打开Nerd
    nnoremap <silent> wf :NERDTreeToggle<CR>
endif
if nhz#Has_bundle( 'vimshell' ) "{{{3
    " ws 打开shell
    nnoremap <silent> ws :VimShellPop<CR>
endif
if nhz#Has_bundle( 'tagbar' ) "{{{3
    " wt 打开或关闭tagbar
    nnoremap <silent> wt :TagbarToggle<CR>
endif
" w-hjkl 切换window{{{3
nnoremap wj <C-W>j
nnoremap wk <C-W>k
nnoremap wh <C-W>h
nnoremap wl <C-W>l
" <F5> 根据文件类型运行文件{{{2
nnoremap <expr> <silent> <F5> <SID>execute()
" <F7> 根据文件类型检查或编译文件{{{2
nnoremap <expr> <silent> <F7> <SID>check_or_compile()
" views{{{2
" en 切换行号{{{3
nnoremap <silent> en :call <SID>toggle_number()<CR>
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
if nhz#Has_bundle( 'neosnippet' )
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ (pumvisible() ? "\<C-n>" : "\<Plug>(neosnippet_expand_or_jump)")
                \: ( pumvisible() ? "\<C-n>" : "\<TAB>")
else
    imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
endif
" snippet 选中和跳转{{{2
if nhz#Has_bundle( 'neosnippet' )
    imap <expr><C-k>     "\<Plug>(neosnippet_expand_or_jump)"
endif
" 方向键{{{2
if nhz#Has_bundle( 'neocomplcache' )
    " For cursor moving in insert mode(Not recommended)
    " 经测试是使用方向键移动鼠标时不弹出或关闭匹配列表
    inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
endif
" vmap{{{1
" <space> 折叠选中行{{{2
vnoremap <silent> <space> zf
" 函数{{{1
" 切换显示行号/相对行号/不显示{{{2
function s:toggle_number()
    if &rnu
        setlocal nonu
        setlocal nornu
        setlocal nolist
    elseif &nu
        setlocal nonu
        setlocal rnu
    else
        setlocal list
        setlocal nu
    endif
endfunction
" 根据文件类型运行文件{{{2
function s:execute()
    if &filetype == 'perl'
        if nhz#Has_bundle( 'perl-support' )
            return ":call Perl_Run()\<CR>"
        else
            return ""
        endif
    endif
    if nhz#Has_bundle( 'eclim' )
        if &filetype == 'java'
            return ":Java %\<CR>"
        endif
    endif
endfunction
" 根据文件类型检查文件{{{2
function s:check_or_compile()
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'h' 
        if nhz#Has_bundle( 'clang-complete' )
            return ":call g:ClangUpdateQuickFix()\<CR>"
        else
            return ""
        endif
    elseif nhz#Has_bundle( 'syntastic' )
        return ":SyntasticCheck\<CR>"
    endif
endfunction
" Vim Modeline{{{1
" vim:set fdm=marker:
