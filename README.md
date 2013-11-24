# vimshell-inline-history.vim

This plugin provides inline history completion feature to VimShell.

## Install

Use `neobundle` to install this plugin.

```
NeoBundleLazy 'Shougo/vimshell.vim', { 'depends' : [ 'Shougo/vimproc.vim' ] }
NeoBundleLazy 'supermomonga/vimshell-inline-history.vim', { 'depends' : [ 'Shougo/vimshell.vim' ] }

if neobundle#tap('vimshell.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : [ 'VimShell', 'VimShellPop' ]
        \   }
        \ })
  call neobundle#untap()
endif

if neobundle#tap('vimshell-inline-history.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'filetypes' : [ 'vimshell' ]
        \   }
        \ })
  call neobundle#untap()
endif
```

## Usage

Hit `C-n` or `C-p` to complete history.
