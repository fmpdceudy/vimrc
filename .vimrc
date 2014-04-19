" vi兼容
set nocompatible            "关闭兼容模式，支持vim类型文件在注释中通过" vim:set :"进行当前文件设定
"---------------------------------------------
" pathogen
" 启用pathogen, load plugins in .vim/bundle
let pathogen = expand( "~/.vim/bundle/pathogen" )
if isdirectory( pathogen )
    execute 'source '. pathogen . '/autoload/pathogen.vim'
    let g:pathogen_disabled=[]
    if ( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
        call add( g:pathogen_disabled, 'neocomplcache' )
    else
        call add( g:pathogen_disabled, 'neocomplete' )
    endif
    execute pathogen#infect()
endif
" load vim, pathogen未安装时仍不报错
source ~/.vim/bundle/func/autoload/nhz.vim
"---------------------------------------------
" 编程相关
filetype on
filetype plugin on
filetype indent on
syn on                      "打开语法高亮
"---------------------------------------------
" Vim Modeline:
" vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1
