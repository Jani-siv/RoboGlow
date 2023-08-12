" Collecting file for syntax files

" Save and set 'cpo' option
let s:cpo_save=&cpo
set cpo&vim

"include coreHighlight.vim
runtime! coreHighlight.vim

" Include libraryHighlight.vim
runtime! libraryHighlight.vim

" Include resourceHighlight.vim
runtime! resourceHighlight.vim

:echom "Hello world"
" Restore 'cpo' option
let &cpo=s:cpo_save

" Set current syntax
let b:current_syntax = "robot"

