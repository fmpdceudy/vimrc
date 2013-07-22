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

" 补全所有 buffer 里的内容
" http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=429131&p=3002378#p3002378
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_' 

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"触发omnifunc条件
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.perl = '\h\w*->\|\h\w*->\h\w*\|\h\w*::\|\h\w*::\h\w*'
