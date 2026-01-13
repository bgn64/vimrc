noremap <leader>p :Files<CR>
noremap <leader>f :RGBuffer<CR>
noremap <leader>F :RG<CR>

" Live ripgrep search in current buffer (re-runs rg on every keystroke)
function! RgBufferLive(query, fullscreen)
  let command_fmt = 'rg --line-number --no-heading --color=always -- %s '.fzf#shellescape(expand('%'))
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--delimiter', ':', '--nth', '2..']}
  let spec = fzf#vim#with_preview(spec)
  call fzf#vim#grep(initial_command, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RGBuffer call RgBufferLive(<q-args>, <bang>0)
