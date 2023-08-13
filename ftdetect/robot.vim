" This file needed to detect .robot files
let s:cpo_save=&cpo
set cpo&vim
" Set file type for all robot files
au BufNewFile,BufRead *.robot setlocal filetype=robot
" Create auto command if robot file is opened
" to add new library and resources to highlighting
" set that behind global variable what need to enable from vimrc file
if (RoboGlow != 0)
    autocmd BufRead *.robot call logic#processKeywords#ProcessKeywords(expand('%:p'))
endif
let &cpo=s:cpo_save

