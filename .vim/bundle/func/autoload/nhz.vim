if exists('g:loaded_func')
    finish
endif

let g:loaded_func = 1

" exists check{{{1
" check if one bundle exists by directory names
function nhz#Has_bundle( bundle )
    if exists("g:loaded_pathogen")
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
    endif
    return 0
endfunction
" load dict{{{1
" get dict by filetype
function nhz#Loaddict( list )
    if type( a:list ) != type( {} )
        return
    endif
    let s = expand("<amatch>")
    if s != ""
        for name in split(s, '\.')
            for directory in split(globpath(&runtimepath, 'dict'), '\n')
                for dictfile in split( globpath(directory, name), '\n')
                    let dict = get( a:list, name, '' )
                    let dict = dict .",". dictfile
                    let a:list[name]=dict
                endfor
            endfor
        endfor
    endif
endfunction
" Vim Modeline{{{1
" vim:set fdm=marker:
