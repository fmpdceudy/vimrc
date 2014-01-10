if exists('g:loaded_func')
    finish
endif

let g:loaded_func = 1

" exists check{{{1
" check if one bundle exists by directory names
function nhz#Has_bundle( bundle )
    if !exists("g:loaded_pathogen")
        return 0
    endif
    let sep = pathogen#separator()
    for glob in pathogen#split(&rtp)
        for path in split(glob(glob),"\n")
            let dir = split( path, sep )
            if dir[-1] ==# a:bundle
                return 1
            endif
        endfor
    endfor
    return 0
endfunction
" Vim Modeline{{{1
" vim:set fdm=marker:
