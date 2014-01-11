#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
my $pwd = getcwd;
my %plugins = (
    #功能
    "pathogen"          => "tpope/vim-pathogen",
    "perlomni"          => "c9s/perlomni.vim",
    "sudo"              => "sudo.vim",
    "vimproc"           => "Shougo/vimproc.vim",
    "context_filetype"  => "Shougo/context_filetype.vim",
    #补全
    "neocomplete"       => "Shougo/neocomplete.vim",
    "neosnippet"        => "Shougo/neosnippet.vim",
    #界面相关
    "bufexplorer"       => "bufexplorer.zip",
    "NERD"              => "The-NERD-tree",
    "vimshell"          => "Shougo/vimshell.vim",
    "tagbar"            => "majutsushi/tagbar",
    );
my %install = (
    "vimproc"           => "make",
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
