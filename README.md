vimrc
=====
#文件夹及文件名称个人理解
autoload:自动加载目录，相当于库目录。里面的文件包含各种函数。
函数名称规范：文件a.vim中的b函数的定义是function a#b.  
plugin: 插件目录，当启动vim时自动执行这个目录里的文件。  
ftplugin:文件类型相关插件目录，当启动vim时根据打开的文件类型选择本目录下同名的文件进行执行。  
doc:文档目录  
bundle: pathogen所管理插件目录。  
filetype.vim:根据文件后缀设定文件类型.
