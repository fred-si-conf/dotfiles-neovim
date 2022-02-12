" Enable file type detection.
filetype plugin indent on

autocmd FileType sh,bash,zsh
    \ setlocal foldmethod=indent

autocmd FileType c,cpp,h,arduino
    \ setlocal foldmethod=syntax|
    \ setlocal tw=78

