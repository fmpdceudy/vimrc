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
    #wiki{{{1
    "vimwiki"           => "vimwiki/vimwiki",
    #shell{{{1
    "vimproc"           => "Shougo/vimproc.vim",
    "vimshell"          => "Shougo/vimshell.vim",
    #IDE{{{1
    "bufexplorer"       => "bufexplorer.zip",
    "tagbar"            => "majutsushi/tagbar",
    "NERD"              => "The-NERD-tree",
    #自动补全{{{1
    "neocomplete"       => "Shougo/neocomplete.vim",
    #snippets{{{1
    "neosnippet"        => "Shougo/neosnippet.vim",
    "neo-snippets"      => "Shougo/neosnippet-snippets",
    #文件类型{{{1
    "context-filetype"  => "Shougo/context_filetype.vim",
    #perl{{{2
    "perlomni"          => "c9s/perlomni.vim",
    #php{{{2
    "phpcomplete"       => "shawncplus/phpcomplete.vim",
    "tools/phpctags"    => "vim-php/phpctags",
    "tagbar-phpctags"   => "vim-php/tagbar-phpctags.vim",
    #c/c++{{{2
    "clang-complete"    => "Rip-Rip/clang_complete",
    "a"                 => "a.vim",
    #}}}1
    );
my %install = (
    "vimproc"           => "make",
    "tools/phpctags"    => "make; cp phpctags ../../tagbar-phpctags/",
);
my $budle = ".vim/bundle/";
mkdir ".vim/bundle/tools";
if( !defined $ARGV[0] ) {
    print "install: reinstall plugins\n";
    print "update: update plugins\n";
    exit;
}
if( $ARGV[0] eq "install" ) {
    if( -f ".gitignore" ) {
        unlink ".gitignore";
    }
    `echo .gitignore >> .gitignore`;
    while( my ($path, $git) = each %plugins ) {
        $path = $budle.$path;
        $git = &gitaddr( $git );
        print $path."\n";
        if ( -d $path ) {
            `rm -fr $path`;
        }
        `git clone $git $path --depth 1`;
        `echo $path >> .gitignore`;
    }
}
if( $ARGV[0] eq "update" ) {
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
                `git pull`;
                `git checkout .`;
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
}
if( $ARGV[0] eq "update" || $ARGV[0] eq "install" ) {
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
