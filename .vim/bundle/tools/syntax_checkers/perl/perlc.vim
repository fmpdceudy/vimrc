if exists("g:loaded_syntastic_perl_perlc_checker")
    finish
endif
let g:loaded_syntastic_perl_perlc_checker = 1

let s:save_cpo = &cpo
set cpo&vim
function! s:parseConfig()
    let l:local_conf = findfile('.perl_lib', getcwd() . ',.;')
    if l:local_conf == '' || !filereadable(l:local_conf)
        return
    endif

    let l:root = substitute(fnamemodify(l:local_conf, ':p:h'), '\', '/', 'g')

    let l:opts = readfile(l:local_conf)
    for l:opt in l:opts
        " Use forward slashes only
        let l:opt = substitute(l:opt, '\', '/', 'g')
        " Handling of absolute path
        if matchstr(l:opt, '\C-I\s*/') != ''
            let l:opt = substitute(l:opt, '\C-I\s*\(/\%(\w\|\\\s\)*\)',
                        \ '-I' . '\1', 'g')
        else
            let l:opt = substitute(l:opt, '\C-I\s*\(\%(\w\|\.\|/\|\\\s\)*\)',
                        \ '-I' . l:root . '/\1', 'g')
        endif
        let b:perl_user_options .= ' ' . l:opt
    endfor
endfunction
function! SyntaxCheckers_perl_perlc_GetLocList() dict
    let b:perl_user_options = ''
    call s:parseConfig()
    let makeprg = self.makeprgBuild( {
        \ 'args': b:perl_user_options . ' -cW',
        \ 'args_after': '' })

    let errorformat=
        \ '%-G%.%#syntax\ OK,'.
        \ '%-GBEGIN failed--compilation aborted%.%#,'.
        \ '%m\ at\ %f\ line\ %l.,'.
        \ '%-G\s%#'
    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

let g:syntastic_perl_checkers=['perlc']
let g:syntastic_perl_perlc_exec='perl'

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'perl',
    \ 'name': 'perlc'})


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
