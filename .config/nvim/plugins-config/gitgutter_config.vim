let g:gitgutter_enabled=1
set updatetime=100

" function! GitStatus()
" 	if gitgutter#utility#is_active("%")
" 		let [a,m,r] = GitGutterGetHunkSummary()
" 		return printf('+%d ~%d -%d', a, m, r)
" 	else
" 		return '\0'
" 	endif
" endfunction

let g:gitgutter_terminal_reports_focus = 0

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
