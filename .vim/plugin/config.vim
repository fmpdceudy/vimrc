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
    au FileType * call s:loadtype()
    function! s:loadtype()
        let s = expand( "<amatch>" )
        for name in split( s, '\.' )
            exec 'runtime! tagbar/' . name . '.vim'
        endfor
    endfunction
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
if nhz#Has_bundle( 'neocomplcache' ) && !nhz#Has_bundle( 'neocomplete' )
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
    augroup filetypeplugin
        au FileType * call nhz#Loaddict( g:neocomplcache_dictionary_filetype_lists )
    augroup END
    "}}}
endif
" neocomplete{{{2
if nhz#Has_bundle( 'neocomplete' )
    " use neocomplete
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase
    let g:neocomplete#enable_smart_case = 1
    " Set minumum syntax keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " 定义关键字{{{3
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    " omni function{{{3
    if !exists('g:neocomplete#sources#omni#functions')
        let g:neocomplete#sources#omni#functions = {}
    endif
    " 触发omnifunc条件{{{3
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\|\h\w*->\h\w*\|\h\w*::\|\h\w*::\h\w*'
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    " force omni{{{3
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    if nhz#Has_bundle( 'eclim' )
        let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'
    endif
    if nhz#Has_bundle( 'clang-complete' )
        let g:neocomplete#force_overwrite_completefunc = 1
        let g:neocomplete#force_omni_input_patterns.c =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
        let g:neocomplete#force_omni_input_patterns.cpp =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.objc =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
        let g:neocomplete#force_omni_input_patterns.objcpp =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    endif
    " 根据文件类型选用dict字典{{{3
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \}
    augroup filetypeplugin
        au FileType * call nhz#Loaddict( g:neocomplete#sources#dictionary#dictionaries )
    augroup END
    "}}}
endif
" neosnippet{{{2
if nhz#Has_bundle( 'neosnippet' )
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
endif
" eclim{{{2
if nhz#Has_bundle( 'eclim' )
    " 设置omnifunc,进行补全提示
    let g:EclimCompletionMethod = 'omnifunc'
    " 补全提示只显示menu,不显示preview
    set completeopt=menu
    " 关闭临时文件生成
    let g:EclimTempFilesEnable = 0
    " 在本窗口打开文件
    let g:EclimDefaultFileOpenAction = 'edit'
endif
" clang_complete{{{2
if nhz#Has_bundle( 'clang-complete' )
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 1
    let g:clang_periodic_quickfix = 0
endif
" vimwiki{{{2
if nhz#Has_bundle( 'vimwiki' )
    let g:vimwiki_list = [{
        \ 'path' : '~/.vimwiki' ,
        \ 'syntax' : 'markdown' ,
        \ 'ext': '.md' ,
        \ 'path_html' : '~/.vimwiki/html' ,
        \ }]
  let g:vimwiki_ext2syntax = {'.md': 'markdown',
        \ '.mkd': 'markdown',
        \ '.wiki': 'media'}
endif
" vim-ibus{{{2
if nhz#Has_bundle( 'vim-ibus' )
    function! s:IBusDiable()
        if ibus#is_enabled()
            call ibus#disable()
            let b:ibustoggle = 1
        endif
    endfunction
    function! s:IBusRenable()
        if exists( "b:ibustoggle" )
            if b:ibustoggle == 1
                call ibus#enable()
                let b:ibustoggle = 0
            endif
        else
            let b:ibustoggle = 0
        endif
    endfunction
    autocmd InsertLeave *
            \ call s:IBusDiable()
    autocmd InsertEnter *
            \ call s:IBusRenable()
endif
" a{{{2
if nhz#Has_bundle( 'a' )
    if nhz#Has_bundle( 'perl-support' )
        " 跟perl-support,\ih的map冲突
        " 先禁用，当filetype不是perl时再启用
        let g:loaded_alternateFile = 1
        function s:enable() "{{{3
            let s = expand("<amatch>")
            if s != 'perl'
                unlet g:loaded_alternateFile
                runtime plugin/a.vim
            endif
        endfunction "}}}3
        augroup filetypeplugin
            au FileType * call s:enable()
        augroup END
    endif
endif
" syntastic{{{2
if nhz#Has_bundle( 'syntastic' )
    let g:syntastic_mode_map = { 'mode': 'passive',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': [] }
    function! s:syntax() "{{{3
        let s = expand( "<amatch>" )
        for name in split( s, '\.' )
            if !exists( 'g:syntastic_' . name . '_checkers' )
                let g:syntastic_{name}_checkers = []
            endif
        endfor
    endfunction "}}}3
    augroup filetypeplugin
        au FileType * call s:syntax()
    augroup END
endif

" Vim Modeline{{{1
" vim:set fdm=marker:
