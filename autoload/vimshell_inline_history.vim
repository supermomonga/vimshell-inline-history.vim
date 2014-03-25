let s:save_cpo = &cpo
set cpo&vim

" Move history
function! vimshell_inline_history#move(volume)
  let l:current_text = vimshell#get_cur_text()
  let g:vimshell_inline_history#history_point = get(g:, 'vimshell_inline_history#history_point', 0)
  let g:vimshell_inline_history#current_text = get(g:, 'vimshell_inline_history#current_text', l:current_text)
  let g:vimshell_inline_history#stored_current_text = get(g:, 'vimshell_inline_history#stored_current_text', l:current_text)

  if g:vimshell_inline_history#current_text == l:current_text
    if !exists('g:vimshell_inline_history#filtered_history')
      let g:vimshell_inline_history#filtered_history = filter(
            \   copy(vimshell#history#read()),
            \   'match(v:val, g:vimshell_inline_history#current_text) == 0 && v:val !=# g:vimshell_inline_history#current_text'
            \ )
    endif
  else
    let g:vimshell_inline_history#current_text = l:current_text
    let g:vimshell_inline_history#stored_current_text = l:current_text
    let g:vimshell_inline_history#history_point = 0
    let g:vimshell_inline_history#filtered_history = filter(
          \   copy(vimshell#history#read()),
          \   'match(v:val, g:vimshell_inline_history#current_text) == 0 && v:val !=# g:vimshell_inline_history#current_text'
          \ )
  endif

  let g:vimshell_inline_history#history_point += a:volume

  " take care of list index out of bounds
  let l:filtered_history_volume = len(g:vimshell_inline_history#filtered_history)
  if abs(g:vimshell_inline_history#history_point) > l:filtered_history_volume
    let g:vimshell_inline_history#history_point = 0
  endif

  if g:vimshell_inline_history#history_point > 0
    let l:match = g:vimshell_inline_history#filtered_history[g:vimshell_inline_history#history_point - 1]
  elseif g:vimshell_inline_history#history_point < 0
    let l:match = g:vimshell_inline_history#filtered_history[abs(g:vimshell_inline_history#history_point + 1)]
  else
    let l:match = g:vimshell_inline_history#stored_current_text
  endif

  let g:vimshell_inline_history#current_text = l:match
  call feedkeys("\<Plug>(vimshell_move_head)\<Plug>(vimshell_delete_forward_line)" . l:match)
  " call vimshell#view#_set_prompt_command(l:match)
  return ''
endfunction

function! vimshell_inline_history#next()
  call vimshell_inline_history#move(1)
endfunction

function! vimshell_inline_history#prev()
  call vimshell_inline_history#move(-1)
endfunction

function! vimshell_inline_history#default_mappings()
  imap <buffer> <C-p>  <Plug>(vimshell_inline_history#prev)
  imap <buffer> <C-n>  <Plug>(vimshell_inline_history#next)
endfunction

function! vimshell_inline_history#neocomplete_compatible()
  let g:vimshell_inline_history#neocomplete_disable_auto_complete = get(g:,
        \   'vimshell_inline_history#neocomplete_disable_auto_complete',
        \   get(g:, 'neocomplete#disable_auto_complete', 0)
        \ )
  if &filetype ==# 'vimshell'
    let g:neocomplete#disable_auto_complete = 1
  else
    let g:neocomplete#disable_auto_complete = g:vimshell_inline_history#neocomplete_disable_auto_complete
  endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
