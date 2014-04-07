if exists("g:loaded_syntastic_php_zend_checker")
    finish
endif
let g:loaded_syntastic_php_zend_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_php_zend_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args': '--recursive --disable var-arg-unused',
        \ 'args_after': '' })

    let errorformat =
        \ '%-GZend Code Analyzer %.%#,'.
        \ '%-GAnalyzing %.%#...,'.
        \ '%f(line %l): Zend Engine message: %m,'.
        \ '%-G[Zend Code Analyzer] Aborted.,'.
        \ '%-G\s%#'
    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

let g:syntastic_php_checkers=['zend']
let g:syntastic_php_zend_exec='ZendCodeAnalyzer'

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'php',
    \ 'name': 'zend'})


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
