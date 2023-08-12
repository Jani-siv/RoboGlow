"Automatically launch robot file parsing
"au BufNewFile,BufRead *.robot setlocal filetype=robot
"augroup RoboGlowAutocommands
    "autocmd!
    " When a .robot file is opened or created
    autocmd BufReadPost,FileNewPost *.robot call logic#process#processKeywords#ProcessKeywords(expand('<afile>:p'))
    :echom "RoboGlow.vim is now readed"
"augroup END
