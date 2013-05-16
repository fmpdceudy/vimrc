vimrc
=====
##开启自动补全
在.vimrc中加入以下内容:<br>
filetype on<br>
filetype plugin on<br>
filetype indent on<br>
##自动补全
<a href="http://www.vim.org/scripts/script.php?script_id=1879">AutoComplPop</a><br>
功能是补全提示，包含文件包括：<br>
autoload/acp.vim<br>
doc/acp.jax<br>
doc/acp.txt<br>
plugin/acp.vim<br>
在.vimrc中不需要配置。<br>
当输入字符时，两个时自动提示，或\<C\-N\>,\<C\-P\>手动提示。<br>
##java 自动补全
<a href="http://www.vim.org/scripts/script.php?script_id=1785">javacomplete</a><br>
java文件的自动实例，文件包括<br>
autoload/javacomplete.vim<br>
autoload/java\_parser.vim<br>
autoload/Reflection.vim<br>
doc/javacomplete.txt<br>
开启java自动补全，需要在.vimrc中加入以下内容：<br>
setlocal omnifunc=javacomplete#Complete "自动补全<br>
setlocal completefunc=javacomplete#CompleteParamsInf “参数提示<br>
当需要的时候输入\<C-X\>\<C-O\>调用补全提示，在.vimrc中输入以下内容，当输入.时自动调用补全提示。<br>
inoremap \<buffer\> .  .\<C-X\>\<C-O\>\<C-P\><br>
