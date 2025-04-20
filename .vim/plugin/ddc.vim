" ddc{{{2
if nhz#Has_bundle( 'ddc' )
    call ddc#custom#patch_global('ui', 'pum')
    call ddc#custom#patch_global('sources', [
        \ 'neosnippet',
        \ 'around',
        \ 'file',
        \])
    call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank']
        \ },
        \ 'file': {
        \   'mark': 'F',
        \   'isVolatile': v:true,
        \   'forceCompletionPattern': '\S/\S*',
        \ },
        \ 'neosnippet': {'mark': 'ns', 'dup': v:true},
        \ })
    call ddc#enable()
endif
