if nhz#Has_bundle( 'vimwiki' )
    if nhz#Has_bundle( 'neosnippet' )
        imap <expr><buffer><TAB> neosnippet#expandable_or_jumpable() ?
                    \ (pumvisible() ? "\<C-n>" : "\<Plug>(neosnippet_expand_or_jump)")
                    \: ( pumvisible() ? "\<C-n>" : vimwiki#tbl#kbd_tab() )
    else
        imap <expr><buffer><TAB> pumvisible() ? "\<C-n>" : vimwiki#tbl#kbd_tab()
    endif
endif
