if exists("g:sync#loaded")
    finish
endif
let g:sync#loaded = 1

if exists("g:sync#enabled") && g:sync#enabled == 0
    finish
endif

if !exists("g:sync#repo_location")
    let g:sync#repo_location = "$HOME/rc"
endif
let g:sync#repo_location = substitute(g:sync#repo_location, "$HOME", $HOME, "")

if !exists("g:sync#repo_vimrc_location")
    let g:sync#repo_vimrc_location = "vim/.vimrc"
endif
let g:sync#repo_vimrc_location = substitute(g:sync#repo_vimrc_location, "$HOME", $HOME, "")

if !exists("g:sync#repo_commit_message")
    let g:sync#repo_commit_message = ":zap: Updates vim config"
endif

if !exists("g:sync#repo_branch")
    let g:sync#repo_branch = "master"
endif

if !exists("g:sync#repo_upstream")
    let g:sync#repo_upstream = "origin"
endif 

fun! s:Sync()
    echo "Checking file content"
    let l:vimrc_data = readfile($HOME."/.vimrc")
    let l:rc_data = readfile(g:sync#repo_location."/vim/.vimrc")

    if l:vimrc_data == l:rc_data
        echo ".vimrc content not changed"
        return
    else
        echo "Changes detected, syncing..."
    endif

    echo system("cd ".g:sync#repo_location." && git checkout ".g:sync#repo_branch." -q && git pull ".g:sync#repo_upstream." ".g:sync#repo_branch." -q && cp ~/.vimrc ".g:sync#repo_vimrc_location." && git add ".g:sync#repo_vimrc_location." && git commit -m '".g:sync#repo_commit_message."' && git push ".g:sync#repo_upstream." ".g:sync#repo_branch." -q >> /dev/null")

    echo "Synced successfully"
endfun

command! Sync :call s:Sync()
