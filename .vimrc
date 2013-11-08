" vi兼容
set nocompatible            "关闭兼容模式，支持vim类型文件在注释中通过" vim:set :"进行当前文件设定
"---------------------------------------------
" tab键与空格
set expandtab               "自动把Tab转化成指定数目(由tabstop决定)的空格
set tabstop=4               "tab的位置
set softtabstop=4           "不改变tabstop，但让编辑的时候tab看起来是指定的宽度，
                            "输入tab时会插入的tab和空格的混合
                            "对backspace也有效
                            "为了查看效果，可以首先运行:set noet ts=8 sw=4 sts=4 list
                            "然后输入Tab，最后按下Backspace.
                            "可以发现，删除了4个空白，并且把宽度为8的Tab，变成了4个空格.
"---------------------------------------------
" 显示
set listchars=precedes:«,extends:»,tab:▸·,trail:∙,eol:¶
                            "运行:set list命令后，会把Tab显示成▸·，把行尾空格显示成∙，行尾添加¶.
                            "运行:set nowrap命令后，对于超出屏幕范围的行，会在左边界显示«，右边界显示».
set list                    "显示制表符
set nu                      "显示行号
set wrap                    "自动换行
set nolinebreak             "取消整词换行
set whichwrap=b,s,<,>,[,]   "光标从行首和行末时可以跳到另一行去
set scrolloff=5             "Minimal number of screen lines to keep above and below the cursor.
                            "当光标上下移动时上下至少预留的行数，若为5，即下移光标至底部还有五行时，
                            "再下移数据就上移光标底部预留5行。
"---------------------------------------------
" 查找／替换相关
set hlsearch                "高亮显示搜索结果
set incsearch               "查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                            "第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                            "单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                            "找要匹配的单词时，别忘记回车
set gdefault                "替换时所有的行内匹配都被替换，而不是只有第一个
"---------------------------------------------
" 状态栏相关的设置
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2            "always show the status line
"---------------------------------------------
" 编程相关
" pathogen禁用某些插件
let g:pathogen_disabled=[]
call add(g:pathogen_disabled, 'javacomplete')
call add(g:pathogen_disabled, 'VimExplorer')
" 启用pathogen,以子git的模式加载插件
execute pathogen#infect()
filetype on
filetype plugin on
filetype indent on
syn on                      "打开语法高亮
"---------------------------------------------
" Vim Modeline:
" vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1
