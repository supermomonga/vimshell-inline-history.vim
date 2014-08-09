" Inline history completion for VimShell
" Version: 1.0.0
" Author : supermomonga (@supermomonga)

if exists('g:loaded_vimshell_inline_history')
  finish
endif
let g:loaded_vimshell_inline_history = 1

let s:save_cpo = &cpo
set cpo&vim


inoremap <expr> <Plug>(vimshell_inline_history#prev)  vimshell_inline_history#prev()
inoremap <expr> <Plug>(vimshell_inline_history#next)  vimshell_inline_history#next()

let g:vimshell_inline_history#default_mappings = get(g:, 'vimshell_inline_history#default_mappings', 1)
let g:vimshell_inline_history#neocomplete_compatible = get(g:, 'vimshell_inline_history#neocomplete_compatible', 1)

augroup vimshell_inline_history
  autocmd!
  autocmd vimshell_inline_history FileType vimshell call vimshell_inline_history#default_mappings()
  autocmd vimshell_inline_history FileType * call vimshell_inline_history#neocomplete_compatible()
  autocmd vimshell_inline_history BufEnter * call vimshell_inline_history#neocomplete_compatible()
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
