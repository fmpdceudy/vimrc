if exists( "g:tagbar_type_perl" )
    finish
endif
let g:tagbar_type_perl = {
    \ 'ctagstype' : 'perl',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'u:use',
        \ 'r:role',
        \ 'e:exends',
        \ 'c:constant',
        \ 'a:attribute',
        \ 's:subroutine',
        \ 'm:method',
        \ 'l:label'
    \ ],
    \ 'sort'    : 0,
    \ 'deffile' : expand('<sfile>:p:h') . '/perl.cnf'
\ }
