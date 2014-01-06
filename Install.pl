#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $pwd = getcwd;
my %plugins = (
    #功能
    "perlomni"          => "https://github.com/c9s/perlomni.vim.git",
    "sudo"              => "https://github.com/vim-scripts/sudo.vim.git",
    "vimproc"           => "https://github.com/Shougo/vimproc.vim.git",
    "context_filetype"  => "https://github.com/Shougo/context_filetype.vim.git",
    #补全
    "neocomplcache"     => "https://github.com/vim-scripts/neocomplcache.git",
    "neosnippet"        => "https://github.com/Shougo/neosnippet.vim.git",
    #界面相关
    "bufexplorer"       => "https://github.com/vim-scripts/bufexplorer.zip.git",
    "NERD"              => "https://github.com/vim-scripts/The-NERD-tree.git",
    "vimshell"          => "https://github.com/Shougo/vimshell.vim.git",
    "tagbar"            => "https://github.com/majutsushi/tagbar.git",
    );
my $budle = ".vim/bundle/";
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
        print $path."\n";
        if ( -d $path ) {
            `rm -fr $path`;
        }
        `git clone $git $path`;
        `echo $path >> .gitignore`;
    }
}
if( $ARGV[0] eq "update" ) {
    if( -f ".gitignore" ) {
        unlink ".gitignore";
    }
    `echo .gitignore >> .gitignore`;
    while( my ($path, $git) = each %plugins ) {
        $path = $budle.$path;
        print $path."\n";
        if ( -d $path ) {
            chdir $path;
            `git pull`;
            `git checkout .`;
            chdir $pwd;
        } else {
            `git clone $git $path`;
        }
        `echo $path >> .gitignore`;
    }
}
