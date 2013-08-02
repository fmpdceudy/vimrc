"neocomplcache 配置
if exists('g:loaded_config_neocomplcache')
    finish
endif
let g:loaded_config_neocomplcache = 1

"Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"For cursor moving in insert mode(Not recommended)
"经测试是使用方向键移动鼠标时不弹出或关闭匹配列表
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" 补全所有 buffer 里的内容
" http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=429131&p=3002378#p3002378
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_' 

"定义关键字
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"触发omnifunc条件
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.perl = '\h\w*->\|\h\w*->\h\w*\|\h\w*::\|\h\w*::\h\w*'

"根据文件类型选用dict字典
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \}
