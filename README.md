# Vim Sync

Sync your vimrc dynamically with one command

## Features

- **Customizable** - supports many variables
- **Easy to work with** - very straightforward and well-documented

## Installation

### Requirements

- `git`

With [VimPlug](https://github.com/junegunn/vim-plug)

```
Plug 'Streamer272/vim-sync'
```

Or, manually

```
mkdir -p ~/.vim/plugged/vim-sync
git clone https://github.com/Streamer272/vim-sync.git ~/.vim/plugged/vim-rc
```

## Quick start

0. Create a repository on github and clone it into home folder
1. Copy this into your `.vimrc`

```
" enable sync (default: 1)
let g:sync#enabled = 1
" repo location (default: "$HOME/rc")
let g:sync#repo_location = "$HOME/dotfiles"
" vimrc location in your repo (default: "vim/.vimrc")
let g:sync#repo_vimrc_location = ".vimrc"
" change commit message (default: ":zap: Updates vim config")
let g:sync#repo_commit_message = "Update vimrc"
" repo branch (default: "master")
let g:sync#repo_branch = "main"
" repo upstream (default: "origin")
let g:sync#repo_upstream = "origin"
```

2. Next time you edit `.vimrc`, just run `Sync` command (`:Sync`)

## How does it work

Under the hood, `Sync` calls this system command:

```
cd g:sync#repo_location &&
git checkout g:sync#repo_branch -q &&
git pull g:sync#repo_upstream g:sync#repo_branch -q &&
cp ~/.vimrc g:sync#repo_vimrc_location &&
git add g:sync#repo_vimrc_location &&
git commit -m 'g:sync#repo_commit_message' &&
git push g:sync#repo_upstream g:sync#repo_branch -q >> /dev/null
```
