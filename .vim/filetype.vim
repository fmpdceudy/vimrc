let s:cpo_save = &cpo
set cpo&vim

" 检查文件类型时忽略某些后缀
" 来自https://github.com/lilydjwg/dotvim/blob/master/filetype.vim
if exists("*fnameescape")
    au BufNewFile,BufRead ?\+.pacsave,?\+.pacnew
                \ exe "doau filetypedetect BufRead " . fnameescape(expand("<afile>:r"))
elseif &verbose > 0
    echomsg "Warning: some filetypes will not be recognized because this version of Vim does not have fnameescape()"
endif

"文件类型检查
augroup filetypedetect
augroup END
let &cpo = s:cpo_save
unlet s:cpo_save
