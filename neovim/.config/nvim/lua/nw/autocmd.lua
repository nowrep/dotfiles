vim.cmd([[
    augroup vimrc
        autocmd!
        " Folds
        autocmd BufWinEnter * silent! :%foldopen!
        autocmd User Startified setlocal buftype=
        " Comments
        autocmd FileType cpp setlocal commentstring=//%s
        autocmd FileType cmake setlocal commentstring=#%s
        " Quickfix
        autocmd FileType qf wincmd J | setlocal colorcolumn= | setlocal nonumber
        " Syntax from start
        autocmd BufEnter * :syntax sync fromstart
        " CMake
        autocmd FileType make setlocal noexpandtab
        autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
        " Tex
        autocmd filetype tex setlocal wrap
        autocmd filetype tex command OpenPdf call system("okular " . expand("build/*.pdf") . "&")
        " Startify
        autocmd User Startified setlocal buftype=
        " vim-closer
        autocmd FileType rust let b:closer = 1 | let b:closer_flags = '([{'
        " CoC
        autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
]])
