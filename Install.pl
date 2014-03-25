#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $pwd = getcwd;
my %plugins = (
    #功能
    "pathogen"          => "tpope/vim-pathogen",
    "sudo"              => "sudo.vim",
    "vimproc"           => "Shougo/vimproc.vim",
    "grep"              => "yegappan/grep",
    "a"                 => "a.vim",
    "tools/phpctags"    => "vim-php/phpctags",
    "vimwiki"           => "vimwiki/vimwiki",
    "vim-ibus"          => "bouzuya/vim-ibus",
    #文件类型
    "context-filetype"  => "Shougo/context_filetype.vim",
    #omni
    "perlomni"          => "c9s/perlomni.vim",
    "phpcomplete"       => "shawncplus/phpcomplete.vim",
    "clang-complete"    => "Rip-Rip/clang_complete",
    #补全环境
    "neocomplete"       => "Shougo/neocomplete.vim",
    "neosnippet"        => "Shougo/neosnippet.vim",
    "neo-snippets"      => "Shougo/neosnippet-snippets",
    #界面相关
    "bufexplorer"       => "bufexplorer.zip",
    "NERD"              => "The-NERD-tree",
    "vimshell"          => "Shougo/vimshell.vim",
    "tagbar"            => "majutsushi/tagbar",
    "tagbar-phpctags"   => "vim-php/tagbar-phpctags.vim",
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
