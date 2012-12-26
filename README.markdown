# llrt does dotfiles

## dotfiles

These are my personal dotfiles, based on holman's dotfile.

## install

(Pretty much the same as in holman's dotfile)

Run this:

```sh
git clone https://github.com/llrt/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap-mac
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

REMARK 1: currently, bootstrap script is made only for mac, as it uses homebrew (that's why I renamed it to bootstrap-mac)

REMARK 2: currently, a file in path .dotfiles/a/b/c.symlink will be symlinked to ~/.c , not to ~/a/b/.c 

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

You'll also want to change `git/gitconfig.symlink`, which by default will set you up as
committing as llrt. You probably don't want that.


## thanks

I owe lots of thank to Zack Holman, for the dotfile project I forked and the ideas behind the structure for the files and bootstrap script.
