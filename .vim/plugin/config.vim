" 插件配置{{{1
if exists('g:loaded_plugin_config')
    finish
endif

let g:loaded_plugin_config = 1
" 配置{{{1
" bufexplore{{{2
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy="mru"
let g:bufExplorerSplitright =0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize=30
autocmd BufWinEnter \[Buf List\] setl nonumber
" winmanager{{{2
let g:persistentBehaviour= 0                " 只剩一个窗口时，退出vim
let g:winManagerWindowLayout='TagList'      " 打开taglist窗口
" set tags{{{2
let s:file = findfile("tags",".;")
if !empty(s:file)
    execute "set tags+=".s:file
endif
" taglist{{{2
let Tlist_Show_One_File=1                   " 只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1                 " 在taglist是最后一个窗口时退出vim.
" neocomplcache{{{2
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 补全所有buffer 里的内容{{{3
" http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=429131&p=3002378#p3002378
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_' 
" 定义关键字{{{3
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 触发omnifunc条件{{{3
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.perl = '\h\w*->\|\h\w*->\h\w*\|\h\w*::\|\h\w*::\h\w*'
" 根据文件类型选用dict字典{{{3
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \}
" Vim Modeline{{{1
" vim:set fdm=marker:
