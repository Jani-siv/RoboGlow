" Set robot file type if global robot_syntax_for_txt is set
" This might not needed anymore
let s:cpo_save=&cpo
set cpo&vim

" Try to guess when dealing with .html, .txt, or .rst files:
"au BufNewFile,BufRead *.txt call s:FTrobot()
"au BufNewFile,BufRead *.rst call s:FTrobot()
"au BufNewFile,BufRead *.html call s:FTrobot()
" No resorting to heuristics for .robot files:
au BufNewFile,BufRead *.robot setlocal filetype=robot

func! s:FTrobot()
    let b:topl = getline(1)
    if (exists("g:robot_syntax_for_txt") && g:robot_syntax_for_txt)
    \ || b:topl =~ '\*\*\*.\{-}\*\*\*'
    \ || b:topl =~ '^# -\*- coding: robot -\*-$'
        setlocal filetype=robot
    endif
endfunc

"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
