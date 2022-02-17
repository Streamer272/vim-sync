if exists("g:vim_sync_loaded")
    finish
endif
let g:vim_sync_loaded = 1

if !exists("g:repo_location")
    let g:repo_location = "$HOME/rc"
endif

if !exists("g:repo_commit_message")
    let g:repo_commit_message = ":zap: Updates vim config"

if !exists("g:repo_branch")
    let g:repo_branch = "main"
endif

if !exists("g:repo_upstream")
    let g:repo_upstream = "origin"
endif 

fun! s:Sync()
   echo "Syncing..." 
   "exec "!kill 27213"
   !kill 27213

   "call system("cd " . g:repo_location)
   "call system("cp ~/.vimrc " . g:repo_location . "/vim/.vimrc")
   "call system("git checkout " . g:repo_branch)
   "call system("git pull " . g:repo_upstream . " " . g:repo_branch)
   "call system("git add ./vim/.vimrc")
   "call system("git commit -m '" . g:repo_commit_message . "'")
   "call system("git push " . g:repo_upstream . " " . g:repo_branch)
endfun

command! Sync :call s:Sync()
