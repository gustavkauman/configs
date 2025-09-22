augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile /tmp/mutt*              setfiletype mail
  autocmd Filetype mail                              setlocal fo+=w
  " Git commit message
  autocmd Filetype gitcommit                         setlocal spell tw=72 colorcolumn=73
  " nftables
  autocmd BufRead,BufNewFile *.nft setfiletype nftables
  " Go shortcuts
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <Leader>r <Plug>(go-rename)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  " Rust language server
  "au FileType rust :LanguageClientStart
  " No autocomplete in text
  autocmd BufRead,BufNewFile /tmp/mutt* let g:deoplete#enable_at_startup = 0
  autocmd Filetype tex let g:deoplete#enable_at_startup = 0
  autocmd Filetype text let g:deoplete#enable_at_startup = 0
  autocmd Filetype markdown let g:deoplete#enable_at_startup = 0
  " clang format
  autocmd FileType c,cpp ClangFormatAutoEnable
augroup END
