" Enable diagnostics highlighting
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)
let lspServers = [
      \ #{
      \   name: 'csharp-ls',
      \   filetype: ['cs'],
      \   path: 'csharp-ls',
      \   args: []
      \ }
      \ ]

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap <leader>lf :LspDiag first<CR>
nnoremap <leader>ln :LspDiag next<CR>
nnoremap <leader>lp :LspDiag previous<CR>
nnoremap <leader>lc :LspDiag current<CR>
nnoremap <leader>la :LspDiag show<CR>

nnoremap <leader>gc :LspGotoDeclaration<CR>
nnoremap <leader>gf :LspGotoDefinition<CR>
nnoremap <leader>gi :LspGotoImpl<CR>
nnoremap <leader>gt :LspGotoTypeDef<CR>

" nnoremap <leader>pc :LspPeekDeclaration<CR>
" nnnoremap <leader>pf :LspPeekDefinition<CR>
" nnnoremap <leader>pi :LspPeekImpl<CR>
" nnnoremap <leader>pr :LspPeekReferences<CR>
" nnnoremap <leader>pt :LspPeekTypeDef<CR>

nnoremap <leader>rs :LspRename<CR>

" nnoremap gd :LspGotoDefinition<CR>
" nnoremap gr :LspShowReferences<CR>
" nnoremap K  :LspHover<CR>
" nnoremap gl :LspDiag current<CR>
" nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
" nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
" inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })
