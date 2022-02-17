if exists("g:vim_sync_loaded")
    finish
endif
let g:vim_sync_loaded = 1

if !exists("g:repo_location")
    let g:repo_location = "$HOME/rc"
endif
let g:repo_location = substitute(g:repo_location, "$HOME", $HOME, "")

if !exists("g:repo_commit_message")
    let g:repo_commit_message = ":zap: Updates vim config"
endif

if !exists("g:repo_branch")
    let g:repo_branch = "main"
endif

if !exists("g:repo_upstream")
    let g:repo_upstream = "origin"
endif 

fun! s:Sync()
    echo "Checking file content"
    let l:vimrc_data = readfile($HOME."/.vimrc")
    let l:rc_data = readfile(g:repo_location."/vim/.vimrc")

    if l:vimrc_data == l:rc_data
        echo ".vimrc content not changed"
        return
    else
        echo "Changes detected, syncing..."
    endif

    echo system("cd ".g:repo_location." && git checkout ".g:repo_branch." -q && git pull ".g:repo_upstream." ".g:repo_branch." -q && cp ~/.vimrc ./vim/.vimrc && git add ./vim/.vimrc && git commit -m '".g:repo_commit_message."' && git push ".g:repo_upstream." ".g:repo_branch." -q >> /dev/null")

    echo "Synced"
endfun

command! Sync :call s:Sync()
