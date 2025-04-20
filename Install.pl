#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $pwd = getcwd;
my %plugins = (
    #插件管理{{{1
    "pathogen"          => "tpope/vim-pathogen",
    #中文相关{{{1
    #帮助文档{{{2
    "vimcdoc"           => "jkeylu/vimcdoc",
    #输入法切换{{{2
    "vim-ibus"          => "bouzuya/vim-ibus",
    #工具{{{1
    "sudo"              => "sudo.vim",
    "grep"              => "yegappan/grep",
    "repeat"            => "tpope/vim-repeat",
    "syntastic"         => "scrooloose/syntastic",
    "vimproc"           => "Shougo/vimproc.vim",
    "unite"             => "Shougo/unite.vim",
    "linediff"          => "AndrewRadev/linediff.vim",
    #git{{{2
    "git"               => "tpope/vim-git",
    "fugitive"          => "tpope/vim-fugitive",
    #wiki{{{2
    "vimwiki"           => "vimwiki/vimwiki",
    #shell{{{2
    "vimshell"          => "Shougo/vimshell.vim",
    #IDE{{{1
    "tagbar"            => "majutsushi/tagbar",
    "NERD"              => "The-NERD-tree",
    #自动补全{{{1
    "ddc"       => "Shougo/ddc.vim",
    "denops"     => "vim-denops/denops.vim",
    "pum"       => "Shougo/pum.vim",
    "ddc-ui-pum" => "Shougo/ddc-ui-pum",
    "ddc-matcher_head" => "Shougo/ddc-matcher_head",
    "ddc-sorter_rank" => "Shougo/ddc-sorter_rank",
    "ddc-source-around" => "Shougo/ddc-source-around",
    "ddc-source-file" => "LumaKernel/ddc-source-file",
    #snippets{{{1
    "neosnippet"        => "Shougo/neosnippet.vim",
    "neo-snippets"      => "Shougo/neosnippet-snippets",
    #文件类型{{{1
    "context-filetype"  => "Shougo/context_filetype.vim",
    #c/c++{{{2
    "clang-complete"    => "Rip-Rip/clang_complete",
    "a"                 => "a.vim",
    #freemarker{{{2
    "freemarker"        => "chaquotay/ftl-vim-syntax",
    #javascript{{{2
    "javascript"        => "pangloss/vim-javascript",
    #perl{{{2
    "perlomni"          => "c9s/perlomni.vim",
    "perl-support"      => "perl-support.vim",
    #php{{{2
    "php.indent"        => "2072/PHP-Indenting-for-VIm",
    "phpcomplete"       => "shawncplus/phpcomplete.vim",
    "tools/phpctags"    => "vim-php/phpctags",
    "tagbar-phpctags"   => "vim-php/tagbar-phpctags.vim",
    #prolog{{{2
    "prolog.syntax"     => "adimit/prolog.vim",
    #python{{{2
    "vim-flake8"        => "nvie/vim-flake8",
    "pep8"              => "pep8",
    #}}}1
    );
my %install = (
    "vimproc"           => "make",
    "tools/phpctags"    => "make; cp phpctags ../../tagbar-phpctags/",
);
my $budle = ".vim/bundle/";
mkdir ".vim/bundle/tools";
&update;
sub update {
    if( -f ".gitignore" ) {
        unlink ".gitignore";
    }
    `echo .gitignore >> .gitignore`;
    `echo .netrwhist > .vim/.gitignore`;
    while( my ($path, $git) = each %plugins ) {
        $path = $budle.$path;
        $git = &gitaddr( $git );
        print $path."\n";
        if ( -d $path ) {
            chdir $path;
            my $origin = readpipe( 'git remote show origin |grep Fetch|sed "s/^ *Fetch URL: * //"' );
            chomp( $origin );
            if( $origin eq $git ) {
                `git checkout .`;
                `git pull`;
                chdir $pwd;
            } else {
                chdir $pwd;
                `rm -fr $path`;
                `git clone $git $path --depth 1`;
            }
        } else {
            `git clone $git $path --depth 1`;
        }
        `echo $path >> .gitignore`;
    }
    while( my ($path, $cmd) = each %install ) {
        $path = $budle.$path;
        chdir $path;
        system( $cmd );
        chdir $pwd;
    }
}
sub gitaddr {
    my ($git) = @_;
    $git =~ s/\.git$//;
    if ( $git =~ "^\(http|git|https\):" ) {
        return $git."\.git";
    } elsif ( $git =~ '/' ) {
        return 'https://github.com/'.$git.'.git';
    } else {
        return 'https://github.com/vim-scripts/'.$git.'.git';
    }
}
# vim:set fdm=marker:
