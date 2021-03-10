let g:gitgutter_enabled=1
set updatetime=100

" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction

" set statusline+=%{GitStatus()}
let g:gitgutter_terminal_reports_focus = 0
