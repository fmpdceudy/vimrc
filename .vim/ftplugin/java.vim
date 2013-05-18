"java自动补全
setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#CompleteParamsInf
"映射.输入，当输入.时自动打开补全，而在其他情况下开启补全只能手动<C-X><C-O>
inoremap <buffer> .  .<C-X><C-O><C-P>
call indent#enable()
