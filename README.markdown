# llrt does dotfiles

## dotfiles

These are my personal dotfiles, based on holman's dotfile.

## install

(Same as in holman's dotfile)

Run this:

```sh
git clone https://github.com/llrt/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

You'll also want to change `git/gitconfig.symlink`, which will set you up as
committing as Zach Holman. You probably don't want that.


## thanks

I owe lots of thank to Zack Holman, for the dotfile project I forked and the ideas behind the structure for the files and bootstrap script.