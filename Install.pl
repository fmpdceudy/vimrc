#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $pwd = getcwd;
my %plugins = (
    "winmanager"        => "https://github.com/vim-scripts/winmanager.git",
    "neocomplcache"     => "https://github.com/vim-scripts/neocomplcache.git",
    "perlomni"          => "https://github.com/c9s/perlomni.vim.git",
    "xml"               => "https://github.com/othree/xml.vim",
    "sudo"              => "https://github.com/vim-scripts/sudo.vim.git",
    "bufexplorer"       => "https://github.com/vim-scripts/bufexplorer.zip.git",
    "NERD"              => "https://github.com/vim-scripts/The-NERD-tree.git",
    "neosnippet"        => "https://github.com/Shougo/neosnippet.vim.git",
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
