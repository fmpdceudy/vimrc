" 插件配置{{{1
if exists('g:loaded_plugin_config')
    finish
endif

let g:loaded_plugin_config = 1
" 配置{{{1
" bufexplorer{{{2
if nhz#Has_bundle( 'bufexplorer' )
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    let g:bufExplorerSortBy="mru"
    let g:bufExplorerSplitright =0
    let g:bufExplorerSplitVertical=1
    let g:bufExplorerSplitVertSize=30
    autocmd BufWinEnter \[Buf List\] setl nonumber
endif
" winmanager{{{2
if nhz#Has_bundle( 'winmanager' )
    let g:persistentBehaviour= 0                " 只剩一个窗口时，退出vim
    if nhz#Has_bundle( 'taglist' )
        let g:winManagerWindowLayout='TagList'      " 打开taglist窗口
    endif
endif
" set tags{{{2
let s:file = findfile("tags",".;")
if !empty(s:file)
    execute "set tags+=".s:file
endif
unlet s:file
" tagbar{{{2
if nhz#Has_bundle( 'tagbar' )
    " 左侧显示
    let g:tagbar_left = 1
    " 宽度
    let g:tagbar_width = 20
endif
" taglist{{{2
if nhz#Has_bundle( 'taglist' )
    let Tlist_Show_One_File=1                   " 只显示当前文件的tag
    let Tlist_Exit_OnlyWindow=1                 " 在taglist是最后一个窗口时退出vim.
endif
" NERD_Tree{{{2
if nhz#Has_bundle( 'NERD' )
    let NERDTreeChDirMode=2                     " 选中root即设置为当前目录
    let NERDTreeMinimalUI=1                     " 不显示帮助面板
    let NERDTreeDirArrows=0                     " 目录箭头 1 显示箭头  0传统+-|号
    let NERDTreeWinSize=20                      " 宽度
    let NERDTreeWinPos='right'                  " 在右侧显示窗口
endif
" neocomplcache{{{2
if nhz#Has_bundle( 'neocomplcache' )
    " Use neocomplcache
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 2
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
    function s:Loaddict()"{{{4
        let s = expand("<amatch>")
        if s != ""
            for name in split(s, '\.')
                let g:neocomplcache_dictionary_filetype_lists[name] = '~/.vim/dict/'. name .'.txt'
            endfor
        endif
    endfunction"}}}4
    augroup filetypeplugin
        au FileType * call s:Loaddict()
    "}}}
endif
" neosnippet{{{2
if nhz#Has_bundle( 'neosnippet' )
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/snippets'
endif
" eclim{{{2
if nhz#Has_bundle( 'eclim' )
    " 设置omnifunc,进行补全提示
    let g:EclimCompletionMethod = 'omnifunc'
    " 补全提示只显示menu,不显示preview
    set completeopt=menu
    " 关闭临时文件生成
    let g:EclimTempFilesEnable = 0
endif
" Vim Modeline{{{1
" vim:set fdm=marker:
