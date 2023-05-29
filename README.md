# vimshell-inline-history.vim

This plugin provides inline history completion feature to VimShell.
Works with both Vim + NeoVim.

## Features

![](http://gifzo.net/UKIIEtj887.gif)

- Complete histories by `C-p` and `C-n`.
- Complete histories which start with current input.
- Cycle completion.

## Install

### [neobundle](https://github.com/shougo/neobundle.vim): 

```vim
NeoBundleLazy 'supermomonga/vimshell-inline-history.vim', { 'depends' : [ 'Shougo/vimshell.vim' ] }

if neobundle#tap('vimshell-inline-history.vim')
  call neobundle#config({
  \  'autoload' : {
  \    'filetypes' : [ 'vimshell' ]
  \  }
  \})

  function! neobundle#hooks.on_post_source(bundle)
    "Example of remapping keys for plugin
    imap <buffer> <C-j>  <Plug>(vimshell_inline_history#next)
    imap <buffer> <C-k>  <Plug>(vimshell_inline_history#prev)
  endfunction

  "Example of unmapping default keys
  let g:vimshell_inline_history#default_mappings = 0

  call neobundle#untap()
endif
```

### [vim-plug](https://github.com/junegunn/vim-plug): 

```vim
Plug 'supermomonga/vimshell-inline-history.vim', { 'depends' : [ 'Shougo/vimshell.vim' ] }

function! VSHistmapCB(...)
  let g:vimshell_inline_history#default_mappings = 0
  imap <buffer> <C-j>  <Plug>(vimshell_inline_history#next)
  imap <buffer> <C-k>  <Plug>(vimshell_inline_history#prev)
endfunction

function! VSHistmap()
  if has("nvim")
    call jobstart(['bash','-c','echo "-"; exit;'],{'on_stdout':'VSHistmapCB'})
  else
    call job_start(['bash','-c','echo "-"; exit;'],{'out_cb':'VSHistmapCB'})
  endif
endfunction

"Group name can be arbitrary so long as doesn't conflict with another
augroup VSHistMapping
  autocmd!
  "Get filetype with :echom &filetype when in buffer
  autocmd FileType vimshell :call VSHistmap()
augroup END
```

## Usage

Hit `C-n` or `C-p` to complete history.
