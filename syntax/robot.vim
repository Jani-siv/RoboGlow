" robot file is used to gathering multiple syntax files
" filename needed to be same as file type

" Include other syntax files using expand() with the same folder

source <sfile>:p:h/coreHighlight.vim
source <sfile>:p:h/libraryHighlight.vim
source <sfile>:p:h/resourceHighlight.vim
