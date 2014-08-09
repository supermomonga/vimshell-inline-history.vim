# vimshell-inline-history.vim

This plugin provides inline history completion feature to VimShell.

## Features

![](http://gifzo.net/UKIIEtj887.gif)

- Complete histories by `C-p` and `C-n`.
- Complete histories which start with current input.
- Cycle completion.

## Install

I recommend to use `neobundle` to install this plugin.

```
NeoBundleLazy 'supermomonga/vimshell-inline-history.vim', { 'depends' : [ 'Shougo/vimshell.vim' ] }

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
